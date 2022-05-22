package sortingClean;
import javax.inject.Inject;
import javax.inject.Named;
import java.util.Random;


public class AlgorithmRunner {
    @Inject
    @Named("BubbleSort") SortingAlgorithm<Integer>  quadraticAlgorithm;

    @Inject
    @Named("QuickSort")SortingAlgorithm<Integer> nlognAlgorithm;

    @Inject
    @Named("RandomAlgorithm")SortingAlgorithm<Integer> randomAlgorithm1;

    @Inject
    @Named("RandomAlgorithm")SortingAlgorithm<Integer> randomAlgorithm2;

    @Inject
    @Named("NumberOfElements")int numberOfElements;
    public void runAlgorithms(){
        Random rand = new Random();
        Integer[] ints = rand.ints(1,Integer.MAX_VALUE)
                .distinct()
                .limit(numberOfElements)
                .boxed()
                .toArray(Integer[]::new);
        Integer[] intsClone = ints.clone();
        quadraticAlgorithm.sort(intsClone);
        intsClone = ints.clone();
        nlognAlgorithm.sort(intsClone);
        intsClone = ints.clone();
        randomAlgorithm1.sort(intsClone);
        intsClone = ints.clone();
        randomAlgorithm2.sort(intsClone);
    }


}
