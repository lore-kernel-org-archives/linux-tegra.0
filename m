From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 1/5] drm/dp: Add AUX channel infrastructure
Date: Thu, 20 Feb 2014 16:55:30 +0100
Message-ID: <1392911734-6689-2-git-send-email-thierry.reding@gmail.com>
References: <1392911734-6689-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392911734-6689-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is a superset of the current i2c_dp_aux bus functionality and can
be used to transfer native AUX in addition to I2C-over-AUX messages.

Helpers are provided to read and write the DPCD, either blockwise or
byte-wise. Many of the existing helpers for DisplayPort take a copy of a
portion of the DPCD and operate on that, without a way to write data
back to the DPCD (e.g. for configuration of the link).

Subsequent patches will build upon this infrastructure to provide common
functionality in a generic way.

Reviewed-by: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Reviewed-by: Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v5:
- move comments partially to struct drm_dp_aux_msg in header file
- return -EPROTO on short reads in DPCD helpers

Changes in v4:
- fix a typo in a comment

Changes in v3:
- reorder drm_dp_dpcd_writeb() arguments to be more intuitive
- return number of bytes transferred in drm_dp_dpcd_write()
- factor out drm_dp_dpcd_access()
- describe error codes

 drivers/gpu/drm/drm_dp_helper.c | 110 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h     |  79 +++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 9e978aae8972..da6bcfe178a6 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -346,3 +346,113 @@ int drm_dp_bw_code_to_link_rate(u8 link_bw)
 	}
 }
 EXPORT_SYMBOL(drm_dp_bw_code_to_link_rate);
+
+/**
+ * DOC: dp helpers
+ *
+ * The DisplayPort AUX channel is an abstraction to allow generic, driver-
+ * independent access to AUX functionality. Drivers can take advantage of
+ * this by filling in the fields of the drm_dp_aux structure.
+ *
+ * Transactions are described using a hardware-independent drm_dp_aux_msg
+ * structure, which is passed into a driver's .transfer() implementation.
+ * Both native and I2C-over-AUX transactions are supported.
+ *
+ * An AUX channel can also be used to transport I2C messages to a sink. A
+ * typical application of that is to access an EDID that's present in the
+ * sink device. The .transfer() function can also be used to execute such
+ * transactions. The drm_dp_aux_register_i2c_bus() function registers an
+ * I2C adapter that can be passed to drm_probe_ddc(). Upon removal, drivers
+ * should call drm_dp_aux_unregister_i2c_bus() to remove the I2C adapter.
+ */
+
+static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
+			      unsigned int offset, void *buffer, size_t size)
+{
+	struct drm_dp_aux_msg msg;
+	unsigned int retry;
+	int err;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.address = offset;
+	msg.request = request;
+	msg.buffer = buffer;
+	msg.size = size;
+
+	/*
+	 * The specification doesn't give any recommendation on how often to
+	 * retry native transactions, so retry 7 times like for I2C-over-AUX
+	 * transactions.
+	 */
+	for (retry = 0; retry < 7; retry++) {
+		err = aux->transfer(aux, &msg);
+		if (err < 0) {
+			if (err == -EBUSY)
+				continue;
+
+			return err;
+		}
+
+		if (err < size)
+			return -EPROTO;
+
+		switch (msg.reply & DP_AUX_NATIVE_REPLY_MASK) {
+		case DP_AUX_NATIVE_REPLY_ACK:
+			return err;
+
+		case DP_AUX_NATIVE_REPLY_NACK:
+			return -EIO;
+
+		case DP_AUX_NATIVE_REPLY_DEFER:
+			usleep_range(400, 500);
+			break;
+		}
+	}
+
+	DRM_ERROR("too many retries, giving up\n");
+	return -EIO;
+}
+
+/**
+ * drm_dp_dpcd_read() - read a series of bytes from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the (first) register to read
+ * @buffer: buffer to store the register values
+ * @size: number of bytes in @buffer
+ *
+ * Returns the number of bytes transferred on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
+			 void *buffer, size_t size)
+{
+	return drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, buffer,
+				  size);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_read);
+
+/**
+ * drm_dp_dpcd_write() - write a series of bytes to the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the (first) register to write
+ * @buffer: buffer containing the values to write
+ * @size: number of bytes in @buffer
+ *
+ * Returns the number of bytes transferred on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
+			  void *buffer, size_t size)
+{
+	return drm_dp_dpcd_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer,
+				  size);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_write);
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 73c3d1f2b20d..0eb29f089e61 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -408,4 +408,83 @@ drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
 }
 
+/*
+ * DisplayPort AUX channel
+ */
+
+/**
+ * struct drm_dp_aux_msg - DisplayPort AUX channel transaction
+ * @address: address of the (first) register to access
+ * @request: contains the type of transaction (see DP_AUX_* macros)
+ * @reply: upon completion, contains the reply type of the transaction
+ * @buffer: pointer to a transmission or reception buffer
+ * @size: size of @buffer
+ */
+struct drm_dp_aux_msg {
+	unsigned int address;
+	u8 request;
+	u8 reply;
+	void *buffer;
+	size_t size;
+};
+
+/**
+ * struct drm_dp_aux - DisplayPort AUX channel
+ * @dev: pointer to struct device that is the parent for this AUX channel
+ * @transfer: transfers a message representing a single AUX transaction
+ *
+ * The .dev field should be set to a pointer to the device that implements
+ * the AUX channel.
+ *
+ * Drivers provide a hardware-specific implementation of how transactions
+ * are executed via the .transfer() function. A pointer to a drm_dp_aux_msg
+ * structure describing the transaction is passed into this function. Upon
+ * success, the implementation should return the number of payload bytes
+ * that were transferred, or a negative error-code on failure. Helpers
+ * propagate errors from the .transfer() function, with the exception of
+ * the -EBUSY error, which causes a transaction to be retried. On a short,
+ * helpers will return -EPROTO to make it simpler to check for failure.
+ */
+struct drm_dp_aux {
+	struct device *dev;
+
+	ssize_t (*transfer)(struct drm_dp_aux *aux,
+			    struct drm_dp_aux_msg *msg);
+};
+
+ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
+			 void *buffer, size_t size);
+ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
+			  void *buffer, size_t size);
+
+/**
+ * drm_dp_dpcd_readb() - read a single byte from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to read
+ * @valuep: location where the value of the register will be stored
+ *
+ * Returns the number of bytes transferred (1) on success, or a negative
+ * error code on failure.
+ */
+static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
+					unsigned int offset, u8 *valuep)
+{
+	return drm_dp_dpcd_read(aux, offset, valuep, 1);
+}
+
+/**
+ * drm_dp_dpcd_writeb() - write a single byte to the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to write
+ * @value: value to write to the register
+ *
+ * Returns the number of bytes transferred (1) on success, or a negative
+ * error code on failure.
+ */
+static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
+					 unsigned int offset, u8 value)
+{
+	return drm_dp_dpcd_write(aux, offset, &value, 1);
+}
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.8.4.2
