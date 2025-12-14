package view;

import javax.swing.*;
import javax.swing.table.TableCellRenderer;
import java.awt.*;

class WordWrapCellRenderer extends JTextArea implements TableCellRenderer {

    public WordWrapCellRenderer(int fontSize) {
        setLineWrap(true);
        setWrapStyleWord(true);
        setOpaque(true);
        if (fontSize != 0) setFont(new Font("", Font.BOLD, fontSize));
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value,
                                                   boolean isSelected, boolean hasFocus,
                                                   int row, int column) {
        setText((value == null) ? "" : value.toString());

        return this;
    }

}