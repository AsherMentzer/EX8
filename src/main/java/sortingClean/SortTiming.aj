package sortingClean;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import javax.inject.Inject;
import java.sql.Time;
import java.util.concurrent.TimeUnit;

public aspect SortTiming {
    int contBubbleSort = 0;
    int contInsertionSort = 0;
    int contMergeSort = 0;
    int contQuickSort = 0;

    long allTimeBubbleSort = 0;
    long allTimeInsertionSort  =0;
    long allTimeMergeSort =0;
    long allTimeQuickSort =0;

    @Pointcut ("execution(void *.AlgorithmRunner.runAlgorithms(..))")
    private void run(){};

    @Pointcut ("execution(void *.SortingAlgorithm.sort(..))")
    private void sort(){};

    @Before("sort()")
    public void beforeSort(JoinPoint jp){
        String nameOfSort = jp.getThis().getClass().getName().split("\\.")[1];

        switch (nameOfSort)
        {
            case"BubbleSort":
                contBubbleSort++;
                allTimeBubbleSort -= System.currentTimeMillis();
                break;
            case"InsertionSort":
                contInsertionSort++;
                allTimeInsertionSort -= System.currentTimeMillis();
                break;
            case"MergeSort":
                contMergeSort++;
                allTimeMergeSort -= System.currentTimeMillis();
                break;
            case"QuickSort":
                contQuickSort++;
                allTimeQuickSort -= System.currentTimeMillis();
                break;

        }
    }

    @After("sort()")
    public void afterSort(JoinPoint jp){
        String nameOfSort = jp.getThis().getClass().getName().split("\\.")[1];

        switch (nameOfSort)
        {
            case"BubbleSort":
                allTimeBubbleSort += System.currentTimeMillis();
                break;
            case"InsertionSort":
                allTimeInsertionSort += System.currentTimeMillis();
                break;
            case"MergeSort":
                allTimeMergeSort += System.currentTimeMillis();
                break;
            case"QuickSort":
                allTimeQuickSort+= System.currentTimeMillis();
                break;

        }
    }

    @After("run()")
    public void afterRun(){

        long totalTime = allTimeBubbleSort + allTimeQuickSort + allTimeMergeSort + allTimeInsertionSort;
        System.out.println("Total time of running all sort functions was "+ totalTime + " ms\n");

        System.out.println("In detail:");
        if(contBubbleSort > 0)
            System.out.println("Function sort in BubbleSort ran " + contBubbleSort +" times and took in total " + allTimeBubbleSort +" ms");

        if(contInsertionSort > 0)
            System.out.println("Function sort in InsertionSort ran " + contInsertionSort +" times and took in total " + allTimeInsertionSort +" ms");

        if(contMergeSort > 0)
            System.out.println("Function sort in MergeSort ran " + contMergeSort +" times and took in total " + allTimeMergeSort +" ms");

        if(contQuickSort > 0)
            System.out.println("Function sort in QuickSort ran " + contQuickSort +" times and took in total " + allTimeQuickSort +" ms");
    }




}
