From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 2/7] pwm: Allow chips to support multiple PWMs.
Date: Tue, 20 Dec 2011 11:32:13 +0100
Message-ID: <1324377138-32129-3-git-send-email-thierry.reding@avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324377138-32129-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This commit modifies the PWM core to support multiple PWMs per struct
pwm_chip. It achieves this in a similar way to how gpiolib works, by
allowing PWM ranges to be requested dynamically (pwm_chip.base == -1) or
starting at a given offset (pwm_chip.base >= 0). A chip specifies how
many PWMs it controls using the npwm member. Each of the functions in
the pwm_ops structure gets an additional argument that specified the PWM
number (it can be converted to a per-chip index by subtracting the
chip's base).

The total maximum number of PWM devices is currently fixed to 64, but
can easily be made configurable via Kconfig.

The patch is incomplete in that it doesn't convert any existing drivers
that are now broken.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/pwm/core.c  |  213 +++++++++++++++++++++++++++++++++++----------------
 include/linux/pwm.h |   20 ++++--
 2 files changed, 161 insertions(+), 72 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 71de479..b4c22a9 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -17,6 +17,7 @@
  *  along with this program; see the file COPYING.  If not, write to
  *  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
  */
+
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/list.h>
@@ -25,63 +26,106 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 
+#define NR_PWMS 64
+#define PWM_BITMAP_BITS NR_PWMS
+
 struct pwm_device {
-	struct			pwm_chip *chip;
-	const char		*label;
+	const char *label;
+	unsigned int pwm;
+};
+
+struct pwm_desc {
+	struct pwm_chip		*chip;
 	unsigned long		flags;
 #define FLAG_REQUESTED	0
 #define FLAG_ENABLED	1
-	struct list_head	node;
+	struct pwm_device	pwm;
 };
 
-static LIST_HEAD(pwm_list);
-
 static DEFINE_MUTEX(pwm_lock);
+static DECLARE_BITMAP(allocated_pwms, NR_PWMS);
+static struct pwm_desc pwm_desc[NR_PWMS];
+
+static struct pwm_desc *pwm_to_desc(unsigned int pwm)
+{
+	return (pwm < NR_PWMS) ? &pwm_desc[pwm] : NULL;
+}
 
-static struct pwm_device *_find_pwm(int pwm_id)
+static void free_pwm(unsigned int pwm)
 {
-	struct pwm_device *pwm;
+	struct pwm_desc *desc = pwm_to_desc(pwm);
 
-	list_for_each_entry(pwm, &pwm_list, node) {
-		if (pwm->chip->pwm_id == pwm_id)
-			return pwm;
+	desc->pwm.label = NULL;
+	desc->flags = 0;
+	desc->chip = NULL;
+}
+
+static int __alloc_pwms(int pwm, unsigned int from, unsigned int count)
+{
+	unsigned int start;
+
+	if (pwm >= 0) {
+		if (from > pwm)
+			return -EINVAL;
+
+		from = pwm;
 	}
 
-	return NULL;
+	start = bitmap_find_next_zero_area(allocated_pwms, NR_PWMS, from,
+			count, 0);
+
+	if ((pwm >= 0) && (start != pwm))
+		return -EEXIST;
+
+	if (start + count > NR_PWMS)
+		return -ENOSPC;
+
+	bitmap_set(allocated_pwms, start, count);
+
+	return start;
+}
+
+static void __free_pwms(unsigned int from, unsigned int count)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; i++)
+		free_pwm(from + i);
+
+	bitmap_clear(allocated_pwms, from, count);
 }
 
 /**
- * pwmchip_add() - register a new pwm
- * @chip: the pwm
+ * pwmchip_add() - register a new PWM chip
+ * @chip: the PWM chip
  *
- * register a new pwm. pwm->pwm_id must be initialized. if pwm_id < 0 then
- * a dynamically assigned id will be used, otherwise the id specified,
+ * Register a new PWM chip. If pwm->base < 0 then a dynamically assigned base
+ * will be used.
  */
 int pwmchip_add(struct pwm_chip *chip)
 {
-	struct pwm_device *pwm;
+	unsigned int i;
 	int ret = 0;
 
-	pwm = kzalloc(sizeof(*pwm), GFP_KERNEL);
-	if (!pwm)
-		return -ENOMEM;
-
-	pwm->chip = chip;
-
 	mutex_lock(&pwm_lock);
 
-	if (chip->pwm_id >= 0 && _find_pwm(chip->pwm_id)) {
-		ret = -EBUSY;
+	ret = __alloc_pwms(chip->base, 0, chip->npwm);
+	if (ret < 0)
 		goto out;
+
+	chip->base = ret;
+
+	for (i = 0; i < chip->npwm; i++) {
+		struct pwm_desc *desc = pwm_to_desc(chip->base + i);
+
+		desc->chip = chip;
+		desc->flags = 0;
 	}
 
-	list_add_tail(&pwm->node, &pwm_list);
+	ret = 0;
+
 out:
 	mutex_unlock(&pwm_lock);
-
-	if (ret)
-		kfree(pwm);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pwmchip_add);
@@ -94,77 +138,106 @@ EXPORT_SYMBOL_GPL(pwmchip_add);
  */
 int pwmchip_remove(struct pwm_chip *chip)
 {
-	struct pwm_device *pwm;
+	unsigned int i;
 	int ret = 0;
 
 	mutex_lock(&pwm_lock);
 
-	pwm = _find_pwm(chip->pwm_id);
-	if (!pwm) {
-		ret = -ENOENT;
-		goto out;
-	}
+	for (i = chip->base; i < chip->base + chip->npwm; i++) {
+		struct pwm_desc *desc = pwm_to_desc(i);
 
-	if (test_bit(FLAG_REQUESTED, &pwm->flags)) {
-		ret = -EBUSY;
-		goto out;
+		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
+			ret = -EBUSY;
+			goto out;
+		}
 	}
 
-	list_del(&pwm->node);
+	__free_pwms(chip->base, chip->npwm);
 
-	kfree(pwm);
 out:
 	mutex_unlock(&pwm_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pwmchip_remove);
 
+/**
+ * pwmchip_find() - iterator for locating a specific pwm_chip
+ * @data: data to pass to match function
+ * @match: callback function to check pwm_chip
+ */
+struct pwm_chip *pwmchip_find(void *data, int (*match)(struct pwm_chip *chip,
+						       void *data))
+{
+	struct pwm_chip *chip = NULL;
+	unsigned int i;
+
+	mutex_lock(&pwm_lock);
+
+	for (i = 0; i < NR_PWMS; i++) {
+		struct pwm_desc *desc = pwm_to_desc(i);
+
+		if (!desc->chip)
+			continue;
+
+		if (match(desc->chip, data)) {
+			chip = desc->chip;
+			break;
+		}
+	}
+
+	mutex_unlock(&pwm_lock);
+
+	return chip;
+}
+EXPORT_SYMBOL_GPL(pwmchip_find);
+
 /*
  * pwm_request - request a PWM device
  */
-struct pwm_device *pwm_request(int pwm_id, const char *label)
+struct pwm_device *pwm_request(int pwm, const char *label)
 {
-	struct pwm_device *pwm;
+	struct pwm_device *dev;
+	struct pwm_desc *desc;
 	int ret;
 
+	if ((pwm < 0) || (pwm >= NR_PWMS))
+		return ERR_PTR(-ENOENT);
+
 	mutex_lock(&pwm_lock);
 
-	pwm = _find_pwm(pwm_id);
-	if (!pwm) {
-		pwm = ERR_PTR(-ENOENT);
-		goto out;
-	}
+	desc = pwm_to_desc(pwm);
+	dev = &desc->pwm;
 
-	if (test_bit(FLAG_REQUESTED, &pwm->flags)) {
-		pwm = ERR_PTR(-EBUSY);
+	if (test_bit(FLAG_REQUESTED, &desc->flags)) {
+		dev = ERR_PTR(-EBUSY);
 		goto out;
 	}
 
-	if (!try_module_get(pwm->chip->ops->owner)) {
-		pwm = ERR_PTR(-ENODEV);
+	if (!try_module_get(desc->chip->ops->owner)) {
+		dev = ERR_PTR(-ENODEV);
 		goto out;
 	}
 
-	if (pwm->chip->ops->request) {
-		ret = pwm->chip->ops->request(pwm->chip);
+	if (desc->chip->ops->request) {
+		ret = desc->chip->ops->request(desc->chip, pwm);
 		if (ret) {
-			pwm = ERR_PTR(ret);
+			dev = ERR_PTR(ret);
 			goto out_put;
 		}
 	}
 
-	pwm->label = label;
-	set_bit(FLAG_REQUESTED, &pwm->flags);
+	dev->label = label;
+	dev->pwm = pwm;
+	set_bit(FLAG_REQUESTED, &desc->flags);
 
 	goto out;
 
 out_put:
-	module_put(pwm->chip->ops->owner);
+	module_put(desc->chip->ops->owner);
 out:
 	mutex_unlock(&pwm_lock);
 
-	return pwm;
+	return dev;
 }
 EXPORT_SYMBOL_GPL(pwm_request);
 
@@ -173,16 +246,18 @@ EXPORT_SYMBOL_GPL(pwm_request);
  */
 void pwm_free(struct pwm_device *pwm)
 {
+	struct pwm_desc *desc = container_of(pwm, struct pwm_desc, pwm);
+
 	mutex_lock(&pwm_lock);
 
-	if (!test_and_clear_bit(FLAG_REQUESTED, &pwm->flags)) {
+	if (!test_and_clear_bit(FLAG_REQUESTED, &desc->flags)) {
 		pr_warning("PWM device already freed\n");
 		goto out;
 	}
 
 	pwm->label = NULL;
 
-	module_put(pwm->chip->ops->owner);
+	module_put(desc->chip->ops->owner);
 out:
 	mutex_unlock(&pwm_lock);
 }
@@ -193,7 +268,9 @@ EXPORT_SYMBOL_GPL(pwm_free);
  */
 int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
 {
-	return pwm->chip->ops->config(pwm->chip, duty_ns, period_ns);
+	struct pwm_desc *desc = container_of(pwm, struct pwm_desc, pwm);
+	return desc->chip->ops->config(desc->chip, pwm->pwm, duty_ns,
+			period_ns);
 }
 EXPORT_SYMBOL_GPL(pwm_config);
 
@@ -202,8 +279,10 @@ EXPORT_SYMBOL_GPL(pwm_config);
  */
 int pwm_enable(struct pwm_device *pwm)
 {
-	if (!test_and_set_bit(FLAG_ENABLED, &pwm->flags))
-		return pwm->chip->ops->enable(pwm->chip);
+	struct pwm_desc *desc = container_of(pwm, struct pwm_desc, pwm);
+
+	if (!test_and_set_bit(FLAG_ENABLED, &desc->flags))
+		return desc->chip->ops->enable(desc->chip, pwm->pwm);
 
 	return 0;
 }
@@ -214,7 +293,9 @@ EXPORT_SYMBOL_GPL(pwm_enable);
  */
 void pwm_disable(struct pwm_device *pwm)
 {
-	if (test_and_clear_bit(FLAG_ENABLED, &pwm->flags))
-		pwm->chip->ops->disable(pwm->chip);
+	struct pwm_desc *desc = container_of(pwm, struct pwm_desc, pwm);
+
+	if (test_and_clear_bit(FLAG_ENABLED, &desc->flags))
+		desc->chip->ops->disable(desc->chip, pwm->pwm);
 }
 EXPORT_SYMBOL_GPL(pwm_disable);
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index df9681b..01c0153 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -40,12 +40,17 @@ struct pwm_chip;
  * @disable: disable PWM output toggling
  */
 struct pwm_ops {
-	int			(*request)(struct pwm_chip *chip);
-	void			(*free)(struct pwm_chip *chip);
-	int			(*config)(struct pwm_chip *chip, int duty_ns,
+	int			(*request)(struct pwm_chip *chip,
+						unsigned int pwm);
+	void			(*free)(struct pwm_chip *chip,
+						unsigned int pwm);
+	int			(*config)(struct pwm_chip *chip,
+						unsigned int pwm, int duty_ns,
 						int period_ns);
-	int			(*enable)(struct pwm_chip *chip);
-	void			(*disable)(struct pwm_chip *chip);
+	int			(*enable)(struct pwm_chip *chip,
+						unsigned int pwm);
+	void			(*disable)(struct pwm_chip *chip,
+						unsigned int pwm);
 	struct module		*owner;
 };
 
@@ -56,13 +61,16 @@ struct pwm_ops {
  * @ops: The callbacks for this PWM
  */
 struct pwm_chip {
-	int			pwm_id;
 	const char		*label;
 	struct pwm_ops		*ops;
+	int			base;
+	unsigned int		npwm;
 };
 
 int pwmchip_add(struct pwm_chip *chip);
 int pwmchip_remove(struct pwm_chip *chip);
+struct pwm_chip *pwmchip_find(void *data, int (*match)(struct pwm_chip *chip,
+						       void *data));
 #endif
 
 #endif /* __LINUX_PWM_H */
-- 
1.7.8
