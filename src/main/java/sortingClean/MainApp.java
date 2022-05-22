package sortingClean;

import org.jboss.weld.environment.se.Weld;
import org.jboss.weld.environment.se.WeldContainer;

import javax.enterprise.inject.Produces;
import javax.inject.Named;
import java.util.Random;

public class MainApp {
    static WeldContainer container = new Weld().initialize();

    public static void main(String[] args) {

        AlgorithmRunner algorithmRunner = container.select(AlgorithmRunner.class).get();

        algorithmRunner.runAlgorithms();
    }

    @Produces
    public @Named("NumberOfElements") int NumberOfElementsGenerator(){
        return 10000;
    }

    @Produces
    public @Named("BubbleSort") SortingAlgorithm<Integer> BubbleSortGenerator(){
        return container.select(BubbleSort.class).get();
    }

    @Produces
    public @Named("QuickSort") SortingAlgorithm<Integer> QuickSortGenerator(){
        return container.select(QuickSort.class).get();
    }

    @Produces
    public @Named("RandomAlgorithm")  SortingAlgorithm<Integer> makeRandomSortingAlgorithm(){
        Random random = new Random(System.currentTimeMillis());
        SortingAlgorithm<Integer> sortAlg= null;
        switch (random.nextInt(4)){
            case 0: sortAlg = container.select(QuickSort.class).get();
                break;
            case 1: sortAlg = container.select(MergeSort.class).get();
                break;
            case 2: sortAlg = container.select(BubbleSort.class).get();
                break;
            case 3: sortAlg = container.select(InsertionSort.class).get();
        }
        return sortAlg;
    }
}
