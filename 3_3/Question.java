package Q_3_3;

public class Question {
	public static void main(String[] args) {
		int capacity_per_substack = 5;
		SetOfStacks set = new SetOfStacks(capacity_per_substack);
		for (int i = 0; i < 34; i++) {
			set.push(i);
		}
		for (int i = 0; i < 34; i++) {
			System.out.println("Popped " + set.pop());
		}
		for (int i = 0; i < 34; i++) {
			set.push(i);
		}
		
		System.out.println("Popped " + set.popAt(0) + " From 0");
		System.out.println("Popped " + set.popAt(1) + " From 1");
		System.out.println("Popped " + set.popAt(2) + " From 2");
		System.out.println("Popped " + set.popAt(3) + " From 3");
		System.out.println("Popped " + set.popAt(4) + " From 4");
		System.out.println("Popped " + set.popAt(5) + " From 5");
		System.out.println("Popped " + set.popAt(4) + " From 4");
		System.out.println("Popped " + set.popAt(2) + " From 2");

	}
}
