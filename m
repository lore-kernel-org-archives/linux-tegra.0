From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 1/5] drm/dp: Add AUX channel infrastructure
Date: Tue, 21 Jan 2014 20:24:19 +0100
Message-ID: <1390332263-11974-2-git-send-email-treding@nvidia.com>
References: <1390332263-11974-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1390332263-11974-1-git-send-email-treding@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

This is a superset of the current i2c_dp_aux bus functionality and can
be used to transfer native AUX in addition to I2C-over-AUX messages.

Helpers are provided to read and write the DPCD, either blockwise or
byte-wise. Many of the existing helpers for DisplayPort take a copy of a
portion of the DPCD and operate on that, without a way to write data
back to the DPCD (e.g. for configuration of the link).

Subsequent patches will build upon this infrastructure to provide common
functionality in a generic way.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- fix a typo in a comment

Changes in v3:
- reorder drm_dp_dpcd_writeb() arguments to be more intuitive
- return number of bytes transferred in drm_dp_dpcd_write()
- factor out drm_dp_dpcd_access()
- describe error codes

 drivers/gpu/drm/drm_dp_helper.c | 110 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h     |  67 ++++++++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 9e978aae8972..3e74ed93b19f 100644
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
+ * The .transfer() function is the hardware-specific implementation of how
+ * a transaction is executed on the AUX channel. A pointer to a struct
+ * drm_dp_aux_msg describing the transaction is passed into this function.
+ * Upon success, the implementation should return the number of bytes that
+ * were transferred, or a negative error-code on failure. Helpers propagate
+ * errors from the .transfer() function, with the exception of the -EBUSY
+ * error, which causes a transaction to be retried.
+ *
+ * The .dev field should be set to a pointer to the device that implements
+ * the AUX channel.
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
+		if (err == 0)
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
+ * if the retry count was exceeded. If no bytes were transferred, -EPROTO is
+ * returned. Errors from the underlying AUX channel transfer function, with
+ * the exception of -EBUSY (upon which the transaction will be retried), are
+ * propagated to the caller.
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
+ * if the retry count was exceeded. If no bytes were transferred, -EPROTO is
+ * returned. Errors from the underlying AUX channel transfer function, with
+ * the exception of -EBUSY (upon which the transaction will be retried), are
+ * propagated to the caller.
+ */
+ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
+			  void *buffer, size_t size)
+{
+	return drm_dp_dpcd_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer,
+				  size);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_write);
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1d09050a8c00..c69c1dc1b741 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -398,4 +398,71 @@ drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
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
