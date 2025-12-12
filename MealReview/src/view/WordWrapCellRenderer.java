package view; // DayMealView와 동일한 패키지에 있다면

import javax.swing.*;
import javax.swing.table.TableCellRenderer;
import java.awt.*;

// TableCellRenderer 인터페이스를 구현하는 JTextArea 기반 클래스
// WordWrapCellRenderer 클래스 (수정됨)

class WordWrapCellRenderer extends JTextArea implements TableCellRenderer {

    public WordWrapCellRenderer() {
        setLineWrap(true);
        setWrapStyleWord(true);
        setOpaque(true);
        // setHorizontalAlignment(JTextArea.CENTER); // 이전 대화에서 제거됨
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value,
                                                   boolean isSelected, boolean hasFocus,
                                                   int row, int column) {
        setText((value == null) ? "" : value.toString());

        // 선택 상태에 따른 배경/전경 색상 설정 (이 부분은 유지)
        if (isSelected) {
            setForeground(table.getSelectionForeground());
            setBackground(table.getSelectionBackground());
        } else {
            setForeground(table.getForeground());
            setBackground(table.getBackground());
        }

        // ❌ 셀 내용이 변경될 때마다 행 높이를 다시 계산하여 설정하는 코드 제거!
        // adjustRowHeight(table, row, column);

        return this;
    }

    // ❌ adjustRowHeight 메서드 전체를 제거합니다.
}