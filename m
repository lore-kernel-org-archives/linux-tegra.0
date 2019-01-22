From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] mtd: rawnand: use unnamed union in struct nand_op_instr
Date: Tue, 22 Jan 2019 16:42:54 +0900
Message-ID: <1548142975-14219-2-git-send-email-yamada.masahiro@socionext.com>
References: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Lucas Stach <dev@lynxeye.de>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-tegra@vger.kernel.org

Getting the instruction private data ends up with a quite long
accessors, annoyingly.

Use anonymous union field to save 4 characters "ctx." This should
not introduce ambiguity.

I do not know when GCC started to support unnamed struct/union field,
but at least, the current minimum compiler version, GCC 4.6 supports
it, and so does Clang.

The unnamed struct/union was standardized only recently (ISO C11).
Anyway, the kernel code relies on the GNU extension to some extent.

Besides, struct nand_flash_dev in the same header exploits it.
If this is a problem, somebody should already have reported it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/ams-delta.c    | 18 ++++++-------
 drivers/mtd/nand/raw/fsmc_nand.c    | 41 ++++++++++++++---------------
 drivers/mtd/nand/raw/marvell_nand.c | 16 ++++++------
 drivers/mtd/nand/raw/nand_base.c    | 52 ++++++++++++++++++-------------------
 drivers/mtd/nand/raw/tegra_nand.c   | 10 +++----
 drivers/mtd/nand/raw/vf610_nfc.c    | 14 +++++-----
 include/linux/mtd/rawnand.h         | 28 ++++++++++----------
 7 files changed, 87 insertions(+), 92 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 8312182..e0e4f3b 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -172,33 +172,33 @@ static int ams_delta_exec_op(struct nand_chip *this,
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
 			gpiod_set_value(priv->gpiod_cle, 1);
-			ams_delta_write_buf(priv, &instr->ctx.cmd.opcode, 1);
+			ams_delta_write_buf(priv, &instr->cmd.opcode, 1);
 			gpiod_set_value(priv->gpiod_cle, 0);
 			break;
 
 		case NAND_OP_ADDR_INSTR:
 			gpiod_set_value(priv->gpiod_ale, 1);
-			ams_delta_write_buf(priv, instr->ctx.addr.addrs,
-					    instr->ctx.addr.naddrs);
+			ams_delta_write_buf(priv, instr->addr.addrs,
+					    instr->addr.naddrs);
 			gpiod_set_value(priv->gpiod_ale, 0);
 			break;
 
 		case NAND_OP_DATA_IN_INSTR:
-			ams_delta_read_buf(priv, instr->ctx.data.buf.in,
-					   instr->ctx.data.len);
+			ams_delta_read_buf(priv, instr->data.buf.in,
+					   instr->data.len);
 			break;
 
 		case NAND_OP_DATA_OUT_INSTR:
-			ams_delta_write_buf(priv, instr->ctx.data.buf.out,
-					    instr->ctx.data.len);
+			ams_delta_write_buf(priv, instr->data.buf.out,
+					    instr->data.len);
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
 			ret = priv->gpiod_rdy ?
 			      nand_gpio_waitrdy(this, priv->gpiod_rdy,
-						instr->ctx.waitrdy.timeout_ms) :
+						instr->waitrdy.timeout_ms) :
 			      nand_soft_waitrdy(this,
-						instr->ctx.waitrdy.timeout_ms);
+						instr->waitrdy.timeout_ms);
 			break;
 		}
 
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index c9149a3..dac0f74 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -615,54 +615,51 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
-			pr_debug("  ->CMD      [0x%02x]\n",
-				 instr->ctx.cmd.opcode);
+			pr_debug("  ->CMD      [0x%02x]\n", instr->cmd.opcode);
 
-			writeb_relaxed(instr->ctx.cmd.opcode, host->cmd_va);
+			writeb_relaxed(instr->cmd.opcode, host->cmd_va);
 			break;
 
 		case NAND_OP_ADDR_INSTR:
-			pr_debug("  ->ADDR     [%d cyc]",
-				 instr->ctx.addr.naddrs);
+			pr_debug("  ->ADDR     [%d cyc]", instr->addr.naddrs);
 
-			for (i = 0; i < instr->ctx.addr.naddrs; i++)
-				writeb_relaxed(instr->ctx.addr.addrs[i],
+			for (i = 0; i < instr->addr.naddrs; i++)
+				writeb_relaxed(instr->addr.addrs[i],
 					       host->addr_va);
 			break;
 
 		case NAND_OP_DATA_IN_INSTR:
-			pr_debug("  ->DATA_IN  [%d B%s]\n", instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
-				 ", force 8-bit" : "");
+			pr_debug("  ->DATA_IN  [%d B%s]\n", instr->data.len,
+				 instr->data.force_8bit ? ", force 8-bit" : "");
 
 			if (host->mode == USE_DMA_ACCESS)
-				fsmc_read_buf_dma(host, instr->ctx.data.buf.in,
-						  instr->ctx.data.len);
+				fsmc_read_buf_dma(host, instr->data.buf.in,
+						  instr->data.len);
 			else
-				fsmc_read_buf(host, instr->ctx.data.buf.in,
-					      instr->ctx.data.len);
+				fsmc_read_buf(host, instr->data.buf.in,
+					      instr->data.len);
 			break;
 
 		case NAND_OP_DATA_OUT_INSTR:
-			pr_debug("  ->DATA_OUT [%d B%s]\n", instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
+			pr_debug("  ->DATA_OUT [%d B%s]\n", instr->data.len,
+				 instr->data.force_8bit ?
 				 ", force 8-bit" : "");
 
 			if (host->mode == USE_DMA_ACCESS)
 				fsmc_write_buf_dma(host,
-						   instr->ctx.data.buf.out,
-						   instr->ctx.data.len);
+						   instr->data.buf.out,
+						   instr->data.len);
 			else
-				fsmc_write_buf(host, instr->ctx.data.buf.out,
-					       instr->ctx.data.len);
+				fsmc_write_buf(host, instr->data.buf.out,
+					       instr->data.len);
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
 			pr_debug("  ->WAITRDY  [max %d ms]\n",
-				 instr->ctx.waitrdy.timeout_ms);
+				 instr->waitrdy.timeout_ms);
 
 			ret = nand_soft_waitrdy(chip,
-						instr->ctx.waitrdy.timeout_ms);
+						instr->waitrdy.timeout_ms);
 			break;
 		}
 	}
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 84283c6..55b026d 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1665,10 +1665,10 @@ static void marvell_nfc_parse_instructions(struct nand_chip *chip,
 		case NAND_OP_CMD_INSTR:
 			if (first_cmd)
 				nfc_op->ndcb[0] |=
-					NDCB0_CMD1(instr->ctx.cmd.opcode);
+					NDCB0_CMD1(instr->cmd.opcode);
 			else
 				nfc_op->ndcb[0] |=
-					NDCB0_CMD2(instr->ctx.cmd.opcode) |
+					NDCB0_CMD2(instr->cmd.opcode) |
 					NDCB0_DBC;
 
 			nfc_op->cle_ale_delay_ns = instr->delay_ns;
@@ -1678,7 +1678,7 @@ static void marvell_nfc_parse_instructions(struct nand_chip *chip,
 		case NAND_OP_ADDR_INSTR:
 			offset = nand_subop_get_addr_start_off(subop, op_id);
 			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
-			addrs = &instr->ctx.addr.addrs[offset];
+			addrs = &instr->addr.addrs[offset];
 
 			nfc_op->ndcb[0] |= NDCB0_ADDR_CYC(naddrs);
 
@@ -1724,7 +1724,7 @@ static void marvell_nfc_parse_instructions(struct nand_chip *chip,
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-			nfc_op->rdy_timeout_ms = instr->ctx.waitrdy.timeout_ms;
+			nfc_op->rdy_timeout_ms = instr->waitrdy.timeout_ms;
 			nfc_op->rdy_delay_ns = instr->delay_ns;
 			break;
 		}
@@ -1743,20 +1743,20 @@ static int marvell_nfc_xfer_data_pio(struct nand_chip *chip,
 	bool reading = (instr->type == NAND_OP_DATA_IN_INSTR);
 	int ret;
 
-	if (instr->ctx.data.force_8bit)
+	if (instr->data.force_8bit)
 		marvell_nfc_force_byte_access(chip, true);
 
 	if (reading) {
-		u8 *in = instr->ctx.data.buf.in + offset;
+		u8 *in = instr->data.buf.in + offset;
 
 		ret = marvell_nfc_xfer_data_in_pio(nfc, in, len);
 	} else {
-		const u8 *out = instr->ctx.data.buf.out + offset;
+		const u8 *out = instr->data.buf.out + offset;
 
 		ret = marvell_nfc_xfer_data_out_pio(nfc, out, len);
 	}
 
-	if (instr->ctx.data.force_8bit)
+	if (instr->data.force_8bit)
 		marvell_nfc_force_byte_access(chip, false);
 
 	return ret;
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3407523..3b620cd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1040,10 +1040,10 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 		op.ninstrs--;
 
 	if (offset_in_page >= mtd->writesize)
-		instrs[0].ctx.cmd.opcode = NAND_CMD_READOOB;
+		instrs[0].cmd.opcode = NAND_CMD_READOOB;
 	else if (offset_in_page >= 256 &&
 		 !(chip->options & NAND_BUSWIDTH_16))
-		instrs[0].ctx.cmd.opcode = NAND_CMD_READ1;
+		instrs[0].cmd.opcode = NAND_CMD_READ1;
 
 	ret = nand_fill_column_cycles(chip, addrs, offset_in_page);
 	if (ret < 0)
@@ -1054,7 +1054,7 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 
 	if (chip->options & NAND_ROW_ADDR_3) {
 		addrs[3] = page >> 16;
-		instrs[1].ctx.addr.naddrs++;
+		instrs[1].addr.naddrs++;
 	}
 
 	return nand_exec_op(chip, &op);
@@ -1091,7 +1091,7 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 
 	if (chip->options & NAND_ROW_ADDR_3) {
 		addrs[4] = page >> 16;
-		instrs[1].ctx.addr.naddrs++;
+		instrs[1].addr.naddrs++;
 	}
 
 	return nand_exec_op(chip, &op);
@@ -1237,7 +1237,7 @@ int nand_change_read_column_op(struct nand_chip *chip,
 		if (!len)
 			op.ninstrs--;
 
-		instrs[3].ctx.data.force_8bit = force_8bit;
+		instrs[3].data.force_8bit = force_8bit;
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1321,7 +1321,7 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 	if (chip->options & NAND_ROW_ADDR_3)
 		addrs[naddrs++] = page >> 16;
 
-	instrs[2].ctx.addr.naddrs = naddrs;
+	instrs[2].addr.naddrs = naddrs;
 
 	/* Drop the last two instructions if we're not programming the page. */
 	if (!prog) {
@@ -1338,10 +1338,10 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 		 * to access.
 		 */
 		if (offset_in_page >= mtd->writesize)
-			instrs[0].ctx.cmd.opcode = NAND_CMD_READOOB;
+			instrs[0].cmd.opcode = NAND_CMD_READOOB;
 		else if (offset_in_page >= 256 &&
 			 !(chip->options & NAND_BUSWIDTH_16))
-			instrs[0].ctx.cmd.opcode = NAND_CMD_READ1;
+			instrs[0].cmd.opcode = NAND_CMD_READ1;
 	} else {
 		/*
 		 * Drop the first command if we're dealing with a large page
@@ -1537,7 +1537,7 @@ int nand_change_write_column_op(struct nand_chip *chip,
 		if (ret < 0)
 			return ret;
 
-		instrs[2].ctx.data.force_8bit = force_8bit;
+		instrs[2].data.force_8bit = force_8bit;
 
 		/* Drop the DATA_OUT instruction if len is set to 0. */
 		if (!len)
@@ -1698,7 +1698,7 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		if (chip->options & NAND_ROW_ADDR_3)
-			instrs[1].ctx.addr.naddrs++;
+			instrs[1].addr.naddrs++;
 
 		ret = nand_exec_op(chip, &op);
 		if (ret)
@@ -1890,7 +1890,7 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
-		instrs[0].ctx.data.force_8bit = force_8bit;
+		instrs[0].data.force_8bit = force_8bit;
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1934,7 +1934,7 @@ int nand_write_data_op(struct nand_chip *chip, const void *buf,
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
-		instrs[0].ctx.data.force_8bit = force_8bit;
+		instrs[0].data.force_8bit = force_8bit;
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1998,7 +1998,7 @@ nand_op_parser_must_split_instr(const struct nand_op_parser_pattern_elem *pat,
 		if (!pat->ctx.addr.maxcycles)
 			break;
 
-		if (instr->ctx.addr.naddrs - *start_offset >
+		if (instr->addr.naddrs - *start_offset >
 		    pat->ctx.addr.maxcycles) {
 			*start_offset += pat->ctx.addr.maxcycles;
 			return true;
@@ -2010,7 +2010,7 @@ nand_op_parser_must_split_instr(const struct nand_op_parser_pattern_elem *pat,
 		if (!pat->ctx.data.maxlen)
 			break;
 
-		if (instr->ctx.data.len - *start_offset >
+		if (instr->data.len - *start_offset >
 		    pat->ctx.data.maxlen) {
 			*start_offset += pat->ctx.data.maxlen;
 			return true;
@@ -2126,30 +2126,30 @@ static void nand_op_parser_trace(const struct nand_op_parser_ctx *ctx)
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
 			pr_debug("%sCMD      [0x%02x]\n", prefix,
-				 instr->ctx.cmd.opcode);
+				 instr->cmd.opcode);
 			break;
 		case NAND_OP_ADDR_INSTR:
 			pr_debug("%sADDR     [%d cyc: %*ph]\n", prefix,
-				 instr->ctx.addr.naddrs,
-				 instr->ctx.addr.naddrs < 64 ?
-				 instr->ctx.addr.naddrs : 64,
-				 instr->ctx.addr.addrs);
+				 instr->addr.naddrs,
+				 instr->addr.naddrs < 64 ?
+				 instr->addr.naddrs : 64,
+				 instr->addr.addrs);
 			break;
 		case NAND_OP_DATA_IN_INSTR:
 			pr_debug("%sDATA_IN  [%d B%s]\n", prefix,
-				 instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
+				 instr->data.len,
+				 instr->data.force_8bit ?
 				 ", force 8-bit" : "");
 			break;
 		case NAND_OP_DATA_OUT_INSTR:
 			pr_debug("%sDATA_OUT [%d B%s]\n", prefix,
-				 instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
+				 instr->data.len,
+				 instr->data.force_8bit ?
 				 ", force 8-bit" : "");
 			break;
 		case NAND_OP_WAITRDY_INSTR:
 			pr_debug("%sWAITRDY  [max %d ms]\n", prefix,
-				 instr->ctx.waitrdy.timeout_ms);
+				 instr->waitrdy.timeout_ms);
 			break;
 		}
 
@@ -2308,7 +2308,7 @@ unsigned int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
 	    subop->last_instr_end_off)
 		end_off = subop->last_instr_end_off;
 	else
-		end_off = subop->instrs[instr_idx].ctx.addr.naddrs;
+		end_off = subop->instrs[instr_idx].addr.naddrs;
 
 	return end_off - start_off;
 }
@@ -2362,7 +2362,7 @@ unsigned int nand_subop_get_data_len(const struct nand_subop *subop,
 	    subop->last_instr_end_off)
 		end_off = subop->last_instr_end_off;
 	else
-		end_off = subop->instrs[instr_idx].ctx.data.len;
+		end_off = subop->instrs[instr_idx].data.len;
 
 	return end_off - start_off;
 }
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 13be32c..7c8f3dc 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -366,11 +366,11 @@ static int tegra_nand_cmd(struct nand_chip *chip,
 		case NAND_OP_CMD_INSTR:
 			if (first_cmd) {
 				cmd |= COMMAND_CLE;
-				writel_relaxed(instr->ctx.cmd.opcode,
+				writel_relaxed(instr->cmd.opcode,
 					       ctrl->regs + CMD_REG1);
 			} else {
 				cmd |= COMMAND_SEC_CMD;
-				writel_relaxed(instr->ctx.cmd.opcode,
+				writel_relaxed(instr->cmd.opcode,
 					       ctrl->regs + CMD_REG2);
 			}
 			first_cmd = false;
@@ -379,7 +379,7 @@ static int tegra_nand_cmd(struct nand_chip *chip,
 		case NAND_OP_ADDR_INSTR:
 			offset = nand_subop_get_addr_start_off(subop, op_id);
 			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
-			addrs = &instr->ctx.addr.addrs[offset];
+			addrs = &instr->addr.addrs[offset];
 
 			cmd |= COMMAND_ALE | COMMAND_ALE_SIZE(naddrs);
 			for (i = 0; i < min_t(unsigned int, 4, naddrs); i++)
@@ -408,7 +408,7 @@ static int tegra_nand_cmd(struct nand_chip *chip,
 
 			cmd |= COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
 				COMMAND_TX | COMMAND_A_VALID;
-			memcpy(&reg, instr->ctx.data.buf.out + offset, size);
+			memcpy(&reg, instr->data.buf.out + offset, size);
 
 			writel_relaxed(reg, ctrl->regs + RESP);
 			break;
@@ -432,7 +432,7 @@ static int tegra_nand_cmd(struct nand_chip *chip,
 
 	if (instr_data_in) {
 		reg = readl_relaxed(ctrl->regs + RESP);
-		memcpy(instr_data_in->ctx.data.buf.in + offset, &reg, size);
+		memcpy(instr_data_in->data.buf.in + offset, &reg, size);
 	}
 
 	return 0;
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index a662ca1..227dcdc 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -379,7 +379,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 		return -EINVAL;
 
 	if (instr && instr->type == NAND_OP_CMD_INSTR) {
-		cmd2 |= instr->ctx.cmd.opcode << CMD_BYTE1_SHIFT;
+		cmd2 |= instr->cmd.opcode << CMD_BYTE1_SHIFT;
 		code |= COMMAND_CMD_BYTE1;
 
 		instr = vf610_get_next_instr(subop, &op_id);
@@ -390,7 +390,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 		int i = nand_subop_get_addr_start_off(subop, op_id);
 
 		for (; i < naddrs; i++) {
-			u8 val = instr->ctx.addr.addrs[i];
+			u8 val = instr->addr.addrs[i];
 
 			if (i < 2)
 				col |= COL_ADDR(i, val);
@@ -405,14 +405,14 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
 		trfr_sz = nand_subop_get_data_len(subop, op_id);
 		offset = nand_subop_get_data_start_off(subop, op_id);
-		force8bit = instr->ctx.data.force_8bit;
+		force8bit = instr->data.force_8bit;
 
 		/*
 		 * Don't fix endianness on page access for historical reasons.
 		 * See comment in vf610_nfc_wr_to_sram
 		 */
 		vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + offset,
-				     instr->ctx.data.buf.out + offset,
+				     instr->data.buf.out + offset,
 				     trfr_sz, !nfc->data_access);
 		code |= COMMAND_WRITE_DATA;
 
@@ -420,7 +420,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	}
 
 	if (instr && instr->type == NAND_OP_CMD_INSTR) {
-		cmd1 |= instr->ctx.cmd.opcode << CMD_BYTE2_SHIFT;
+		cmd1 |= instr->cmd.opcode << CMD_BYTE2_SHIFT;
 		code |= COMMAND_CMD_BYTE2;
 
 		instr = vf610_get_next_instr(subop, &op_id);
@@ -435,7 +435,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
 		trfr_sz = nand_subop_get_data_len(subop, op_id);
 		offset = nand_subop_get_data_start_off(subop, op_id);
-		force8bit = instr->ctx.data.force_8bit;
+		force8bit = instr->data.force_8bit;
 
 		code |= COMMAND_READ_DATA;
 	}
@@ -452,7 +452,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 		 * Don't fix endianness on page access for historical reasons.
 		 * See comment in vf610_nfc_rd_from_sram
 		 */
-		vf610_nfc_rd_from_sram(instr->ctx.data.buf.in + offset,
+		vf610_nfc_rd_from_sram(instr->data.buf.in + offset,
 				       nfc->regs + NFC_MAIN_AREA(0) + offset,
 				       trfr_sz, !nfc->data_access);
 	}
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5e37534..b606ed3 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -567,14 +567,12 @@ enum nand_op_instr_type {
 
 /**
  * struct nand_op_instr - Instruction object
- * @type: the instruction type
- * @ctx:  extra data associated to the instruction. You'll have to use the
- *        appropriate element depending on @type
- * @ctx.cmd: use it if @type is %NAND_OP_CMD_INSTR
- * @ctx.addr: use it if @type is %NAND_OP_ADDR_INSTR
- * @ctx.data: use it if @type is %NAND_OP_DATA_IN_INSTR
+ * @type: the instruction type.
+ * @cmd: extra data when @type is %NAND_OP_CMD_INSTR
+ * @addr: extra data when @type is %NAND_OP_ADDR_INSTR
+ * @data: extra data when @type is %NAND_OP_DATA_IN_INSTR
  *	      or %NAND_OP_DATA_OUT_INSTR
- * @ctx.waitrdy: use it if @type is %NAND_OP_WAITRDY_INSTR
+ * @waitrdy: extra data when @type is %NAND_OP_WAITRDY_INSTR
  * @delay_ns: delay the controller should apply after the instruction has been
  *	      issued on the bus. Most modern controllers have internal timings
  *	      control logic, and in this case, the controller driver can ignore
@@ -587,7 +585,7 @@ struct nand_op_instr {
 		struct nand_op_addr_instr addr;
 		struct nand_op_data_instr data;
 		struct nand_op_waitrdy_instr waitrdy;
-	} ctx;
+	};
 	unsigned int delay_ns;
 };
 
@@ -615,14 +613,14 @@ struct nand_op_instr {
 #define NAND_OP_CMD(id, ns)						\
 	{								\
 		.type = NAND_OP_CMD_INSTR,				\
-		.ctx.cmd.opcode = id,					\
+		.cmd.opcode = id,					\
 		.delay_ns = ns,						\
 	}
 
 #define NAND_OP_ADDR(ncycles, cycles, ns)				\
 	{								\
 		.type = NAND_OP_ADDR_INSTR,				\
-		.ctx.addr = {						\
+		.addr = {						\
 			.naddrs = ncycles,				\
 			.addrs = cycles,				\
 		},							\
@@ -632,7 +630,7 @@ struct nand_op_instr {
 #define NAND_OP_DATA_IN(l, b, ns)					\
 	{								\
 		.type = NAND_OP_DATA_IN_INSTR,				\
-		.ctx.data = {						\
+		.data = {						\
 			.len = l,					\
 			.buf.in = b,					\
 			.force_8bit = false,				\
@@ -643,7 +641,7 @@ struct nand_op_instr {
 #define NAND_OP_DATA_OUT(l, b, ns)					\
 	{								\
 		.type = NAND_OP_DATA_OUT_INSTR,				\
-		.ctx.data = {						\
+		.data = {						\
 			.len = l,					\
 			.buf.out = b,					\
 			.force_8bit = false,				\
@@ -654,7 +652,7 @@ struct nand_op_instr {
 #define NAND_OP_8BIT_DATA_IN(l, b, ns)					\
 	{								\
 		.type = NAND_OP_DATA_IN_INSTR,				\
-		.ctx.data = {						\
+		.data = {						\
 			.len = l,					\
 			.buf.in = b,					\
 			.force_8bit = true,				\
@@ -665,7 +663,7 @@ struct nand_op_instr {
 #define NAND_OP_8BIT_DATA_OUT(l, b, ns)					\
 	{								\
 		.type = NAND_OP_DATA_OUT_INSTR,				\
-		.ctx.data = {						\
+		.data = {						\
 			.len = l,					\
 			.buf.out = b,					\
 			.force_8bit = true,				\
@@ -676,7 +674,7 @@ struct nand_op_instr {
 #define NAND_OP_WAIT_RDY(tout_ms, ns)					\
 	{								\
 		.type = NAND_OP_WAITRDY_INSTR,				\
-		.ctx.waitrdy.timeout_ms = tout_ms,			\
+		.waitrdy.timeout_ms = tout_ms,				\
 		.delay_ns = ns,						\
 	}
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
