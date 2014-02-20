From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 4/5] drm/dp: Allow registering AUX channels as I2C busses
Date: Thu, 20 Feb 2014 16:55:33 +0100
Message-ID: <1392911734-6689-5-git-send-email-thierry.reding@gmail.com>
References: <1392911734-6689-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392911734-6689-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Implements an I2C-over-AUX I2C adapter on top of the generic drm_dp_aux
infrastructure. It extracts the retry logic from existing drivers, which
should help in porting those drivers to this new helper.

Reviewed-by: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Reviewed-by: Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v5:
- move comments partially to to header file
- keep MOT set between I2C messages
- return -EPROTO on short reads

Changes in v4:
- fix typo "bitrate" -> "bit rate"

Changes in v3:
- add back DRM_DEBUG_KMS and DRM_ERROR messages
- embed i2c_adapter within struct drm_dp_aux
- fix typo in comment

 drivers/gpu/drm/drm_dp_helper.c | 186 ++++++++++++++++++++++++++++++++++++++--
 include/drm/drm_dp_helper.h     |  12 +++
 2 files changed, 191 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 177ac7bd1851..35251af3b14e 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -357,13 +357,6 @@ EXPORT_SYMBOL(drm_dp_bw_code_to_link_rate);
  * Transactions are described using a hardware-independent drm_dp_aux_msg
  * structure, which is passed into a driver's .transfer() implementation.
  * Both native and I2C-over-AUX transactions are supported.
- *
- * An AUX channel can also be used to transport I2C messages to a sink. A
- * typical application of that is to access an EDID that's present in the
- * sink device. The .transfer() function can also be used to execute such
- * transactions. The drm_dp_aux_register_i2c_bus() function registers an
- * I2C adapter that can be passed to drm_probe_ddc(). Upon removal, drivers
- * should call drm_dp_aux_unregister_i2c_bus() to remove the I2C adapter.
  */
 
 static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
@@ -569,3 +562,182 @@ int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_link_configure);
+
+/*
+ * I2C-over-AUX implementation
+ */
+
+static u32 drm_dp_i2c_functionality(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
+	       I2C_FUNC_SMBUS_READ_BLOCK_DATA |
+	       I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
+	       I2C_FUNC_10BIT_ADDR;
+}
+
+/*
+ * Transfer a single I2C-over-AUX message and handle various error conditions,
+ * retrying the transaction as appropriate.
+ */
+static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
+{
+	unsigned int retry;
+	int err;
+
+	/*
+	 * DP1.2 sections 2.7.7.1.5.6.1 and 2.7.7.1.6.6.1: A DP Source device
+	 * is required to retry at least seven times upon receiving AUX_DEFER
+	 * before giving up the AUX transaction.
+	 */
+	for (retry = 0; retry < 7; retry++) {
+		err = aux->transfer(aux, msg);
+		if (err < 0) {
+			if (err == -EBUSY)
+				continue;
+
+			DRM_DEBUG_KMS("transaction failed: %d\n", err);
+			return err;
+		}
+
+		if (err < msg->size)
+			return -EPROTO;
+
+		switch (msg->reply & DP_AUX_NATIVE_REPLY_MASK) {
+		case DP_AUX_NATIVE_REPLY_ACK:
+			/*
+			 * For I2C-over-AUX transactions this isn't enough, we
+			 * need to check for the I2C ACK reply.
+			 */
+			break;
+
+		case DP_AUX_NATIVE_REPLY_NACK:
+			DRM_DEBUG_KMS("native nack\n");
+			return -EREMOTEIO;
+
+		case DP_AUX_NATIVE_REPLY_DEFER:
+			DRM_DEBUG_KMS("native defer");
+			/*
+			 * We could check for I2C bit rate capabilities and if
+			 * available adjust this interval. We could also be
+			 * more careful with DP-to-legacy adapters where a
+			 * long legacy cable may force very low I2C bit rates.
+			 *
+			 * For now just defer for long enough to hopefully be
+			 * safe for all use-cases.
+			 */
+			usleep_range(500, 600);
+			continue;
+
+		default:
+			DRM_ERROR("invalid native reply %#04x\n", msg->reply);
+			return -EREMOTEIO;
+		}
+
+		switch (msg->reply & DP_AUX_I2C_REPLY_MASK) {
+		case DP_AUX_I2C_REPLY_ACK:
+			/*
+			 * Both native ACK and I2C ACK replies received. We
+			 * can assume the transfer was successful.
+			 */
+			return 0;
+
+		case DP_AUX_I2C_REPLY_NACK:
+			DRM_DEBUG_KMS("I2C nack\n");
+			return -EREMOTEIO;
+
+		case DP_AUX_I2C_REPLY_DEFER:
+			DRM_DEBUG_KMS("I2C defer\n");
+			usleep_range(400, 500);
+			continue;
+
+		default:
+			DRM_ERROR("invalid I2C reply %#04x\n", msg->reply);
+			return -EREMOTEIO;
+		}
+	}
+
+	DRM_ERROR("too many retries, giving up\n");
+	return -EREMOTEIO;
+}
+
+static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
+			   int num)
+{
+	struct drm_dp_aux *aux = adapter->algo_data;
+	unsigned int i, j;
+
+	for (i = 0; i < num; i++) {
+		struct drm_dp_aux_msg msg;
+		int err;
+
+		/*
+		 * Many hardware implementations support FIFOs larger than a
+		 * single byte, but it has been empirically determined that
+		 * transferring data in larger chunks can actually lead to
+		 * decreased performance. Therefore each message is simply
+		 * transferred byte-by-byte.
+		 */
+		for (j = 0; j < msgs[i].len; j++) {
+			memset(&msg, 0, sizeof(msg));
+			msg.address = msgs[i].addr;
+
+			msg.request = (msgs[i].flags & I2C_M_RD) ?
+					DP_AUX_I2C_READ :
+					DP_AUX_I2C_WRITE;
+
+			/*
+			 * All messages except the last one are middle-of-
+			 * transfer messages.
+			 */
+			if ((i < num - 1) || (j < msgs[i].len - 1))
+				msg.request |= DP_AUX_I2C_MOT;
+
+			msg.buffer = msgs[i].buf + j;
+			msg.size = 1;
+
+			err = drm_dp_i2c_do_msg(aux, &msg);
+			if (err < 0)
+				return err;
+		}
+	}
+
+	return num;
+}
+
+static const struct i2c_algorithm drm_dp_i2c_algo = {
+	.functionality = drm_dp_i2c_functionality,
+	.master_xfer = drm_dp_i2c_xfer,
+};
+
+/**
+ * drm_dp_aux_register_i2c_bus() - register an I2C adapter for I2C-over-AUX
+ * @aux: DisplayPort AUX channel
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_aux_register_i2c_bus(struct drm_dp_aux *aux)
+{
+	aux->ddc.algo = &drm_dp_i2c_algo;
+	aux->ddc.algo_data = aux;
+	aux->ddc.retries = 3;
+
+	aux->ddc.class = I2C_CLASS_DDC;
+	aux->ddc.owner = THIS_MODULE;
+	aux->ddc.dev.parent = aux->dev;
+	aux->ddc.dev.of_node = aux->dev->of_node;
+
+	strncpy(aux->ddc.name, dev_name(aux->dev), sizeof(aux->ddc.name));
+
+	return i2c_add_adapter(&aux->ddc);
+}
+EXPORT_SYMBOL(drm_dp_aux_register_i2c_bus);
+
+/**
+ * drm_dp_aux_unregister_i2c_bus() - unregister an I2C-over-AUX adapter
+ * @aux: DisplayPort AUX channel
+ */
+void drm_dp_aux_unregister_i2c_bus(struct drm_dp_aux *aux)
+{
+	i2c_del_adapter(&aux->ddc);
+}
+EXPORT_SYMBOL(drm_dp_aux_unregister_i2c_bus);
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 17b3a8a5ff38..42947566e755 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -431,6 +431,7 @@ struct drm_dp_aux_msg {
 
 /**
  * struct drm_dp_aux - DisplayPort AUX channel
+ * @ddc: I2C adapter that can be used for I2C-over-AUX communication
  * @dev: pointer to struct device that is the parent for this AUX channel
  * @transfer: transfers a message representing a single AUX transaction
  *
@@ -445,8 +446,16 @@ struct drm_dp_aux_msg {
  * propagate errors from the .transfer() function, with the exception of
  * the -EBUSY error, which causes a transaction to be retried. On a short,
  * helpers will return -EPROTO to make it simpler to check for failure.
+ *
+ * An AUX channel can also be used to transport I2C messages to a sink. A
+ * typical application of that is to access an EDID that's present in the
+ * sink device. The .transfer() function can also be used to execute such
+ * transactions. The drm_dp_aux_register_i2c_bus() function registers an
+ * I2C adapter that can be passed to drm_probe_ddc(). Upon removal, drivers
+ * should call drm_dp_aux_unregister_i2c_bus() to remove the I2C adapter.
  */
 struct drm_dp_aux {
+	struct i2c_adapter ddc;
 	struct device *dev;
 
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
@@ -507,4 +516,7 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
 
+int drm_dp_aux_register_i2c_bus(struct drm_dp_aux *aux);
+void drm_dp_aux_unregister_i2c_bus(struct drm_dp_aux *aux);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.8.4.2
