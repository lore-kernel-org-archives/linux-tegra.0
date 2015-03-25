From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 2/5] Fix some TAB alignment issues
Date: Wed, 25 Mar 2015 12:06:14 -0600
Message-ID: <1427306777-17669-2-git-send-email-swarren@wwwdotorg.org>
References: <1427306777-17669-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427306777-17669-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

append_aligned_tabs_indent_with_tabs() was converting TABs to spaces to
simplify calculation of line length, assuming the only TABs were at the
beginning of the line, and hence were all exactly 8 characters wide. In
some scenarios, TABs were also embedded within the line, which caused
incorrect calculations. Solve this by explicitly evaluating TAB widths
character by character, rather than taking shortcuts.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 board-to-uboot.py               |  2 +-
 soc-to-kernel-pinctrl-driver.py |  4 ++--
 tegra_pmx_utils.py              | 26 ++++++++++++++++++--------
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/board-to-uboot.py b/board-to-uboot.py
index f337b6371955..8c5f11f076f7 100755
--- a/board-to-uboot.py
+++ b/board-to-uboot.py
@@ -117,7 +117,7 @@ if board.soc.soc_pins_have_ior:
 		.ioreset	= PMUX_PIN_IO_RESET_DEFAULT,
 '''
 
-s = append_aligned_tabs_indent_with_tabs(s)
+s = append_aligned_tabs_indent_with_tabs(s, 0)
 print(s)
 
 print('''\
diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index f7743e0d4097..46547b194d33 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -302,7 +302,7 @@ else:
 		.drv_reg = -1,
 '''
 
-s = append_aligned_tabs_indent_with_tabs(s)
+s = append_aligned_tabs_indent_with_tabs(s, 72)
 print(s)
 
 print('''\
@@ -372,7 +372,7 @@ s += '''\
 		.drvtype_bit = %(drvtype_bit_val)s
 ''' % globals()
 
-s = append_aligned_tabs_indent_with_tabs(s)
+s = append_aligned_tabs_indent_with_tabs(s, 72)
 print(s)
 
 print('''\
diff --git a/tegra_pmx_utils.py b/tegra_pmx_utils.py
index ece3c1606dc0..2551282963a9 100644
--- a/tegra_pmx_utils.py
+++ b/tegra_pmx_utils.py
@@ -74,21 +74,31 @@ def gen_wrapped_c_macro_header(macro, params):
         s += '\n'
     return s
 
-def append_aligned_tabs_indent_with_tabs(s):
+def len_evaluating_tabs(s):
+    l = 0
+    for c in s:
+        if c == '\t':
+            l = (l + 8) & ~7
+        else:
+            l += 1
+    return l
+
+def append_aligned_tabs_indent_with_tabs(s, min_slashpos):
     lines = s.split('\n')
     if lines[-1].strip() == '':
         del lines[-1]
+    # This is intended to translate leading spaces to TABs, so that callers
+    # don't have to work out the right number of TABs to use. It also would
+    # affect intra-line space, but there is none in practice so far.
     for i, l in enumerate(lines):
-        lines[i] = l.replace('\t', '        ')
+        lines[i] = l.replace('        ', '\t')
     max_len = 0
     for l in lines:
-        max_len = max(max_len, len(l))
-    tabpos = (max_len + 7) // 8
+        max_len = max(max_len, len_evaluating_tabs(l))
+    max_len = max(max_len, min_slashpos)
+    tabpos = (max_len + 7) & ~7
     for i, l in enumerate(lines):
-        remaining = 72 - len(l)
-        lines[i] += gen_tab_padding_to(len(l) + 1, 73) + '\\'
-    for i, l in enumerate(lines):
-        lines[i] = l.replace('        ', '\t')
+        lines[i] += gen_tab_padding_to(len_evaluating_tabs(l) + 1, tabpos + 1) + '\\'
     return '\n'.join(lines)
 
 def yn_to_boolean(s):
-- 
1.9.1
