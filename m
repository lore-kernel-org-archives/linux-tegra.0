From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Tue, 12 Jun 2018 10:06:42 +0200
Message-ID: <cb6f2ef0a5a41e001a2019caa1a18c23@agner.ch>
References: <20180611205224.23340-1-stefan@agner.ch>
 <20180611205224.23340-5-stefan@agner.ch> <4258393.O1xtUOGbca@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4258393.O1xtUOGbca@dimapc>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, boris.brezillon@bootlin.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12.06.2018 02:03, Dmitry Osipenko wrote:
> On Monday, 11 June 2018 23:52:22 MSK Stefan Agner wrote:
>> Add support for the NAND flash controller found on NVIDIA
>> Tegra 2 SoCs. This implementation does not make use of the
>> command queue feature. Regular operations/data transfers are
>> done in PIO mode. Page read/writes with hardware ECC make
>> use of the DMA for data transfer.
>>
>> Signed-off-by: Lucas Stach <dev@lynxeye.de>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  MAINTAINERS                       |    7 +
>>  drivers/mtd/nand/raw/Kconfig      |    6 +
>>  drivers/mtd/nand/raw/Makefile     |    1 +
>>  drivers/mtd/nand/raw/tegra_nand.c | 1248 +++++++++++++++++++++++++++++
>>  4 files changed, 1262 insertions(+)
>>  create mode 100644 drivers/mtd/nand/raw/tegra_nand.c
>>
[snip]
>> +static int tegra_nand_cmd(struct nand_chip *chip,
>> +			 const struct nand_subop *subop)
>> +{
>> +	const struct nand_op_instr *instr;
>> +	const struct nand_op_instr *instr_data_in = NULL;
>> +	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
>> +	unsigned int op_id, size = 0, offset = 0;
>> +	bool first_cmd = true;
>> +	u32 reg, cmd = 0;
>> +	int ret;
>> +
>> +	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
>> +		unsigned int naddrs, i;
>> +		const u8 *addrs;
>> +		u32 addr1 = 0, addr2 = 0;
>> +
>> +		instr = &subop->instrs[op_id];
>> +
>> +		switch (instr->type) {
>> +		case NAND_OP_CMD_INSTR:
>> +			if (first_cmd) {
>> +				cmd |= COMMAND_CLE;
>> +				writel_relaxed(instr->ctx.cmd.opcode,
>> +					       ctrl->regs + CMD_REG1);
>> +			} else {
>> +				cmd |= COMMAND_SEC_CMD;
>> +				writel_relaxed(instr->ctx.cmd.opcode,
>> +					       ctrl->regs + CMD_REG2);
>> +			}
>> +			first_cmd = false;
>> +			break;
>> +		case NAND_OP_ADDR_INSTR:
>> +			offset = nand_subop_get_addr_start_off(subop, op_id);
>> +			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
>> +			addrs = &instr->ctx.addr.addrs[offset];
>> +
>> +			cmd |= COMMAND_ALE | COMMAND_ALE_SIZE(naddrs);
>> +			for (i = 0; i < min_t(unsigned int, 4, naddrs); i++)
>> +				addr1 |= *addrs++ << (BITS_PER_BYTE * i);
>> +			naddrs -= i;
>> +			for (i = 0; i < min_t(unsigned int, 4, naddrs); i++)
>> +				addr2 |= *addrs++ << (BITS_PER_BYTE * i);
>> +			writel_relaxed(addr1, ctrl->regs + ADDR_REG1);
>> +			writel_relaxed(addr2, ctrl->regs + ADDR_REG2);
>> +			break;
>> +
>> +		case NAND_OP_DATA_IN_INSTR:
>> +			size = nand_subop_get_data_len(subop, op_id);
>> +			offset = nand_subop_get_data_start_off(subop, op_id);
>> +
>> +			cmd |= COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
>> +				COMMAND_RX | COMMAND_A_VALID;
>> +
>> +			instr_data_in = instr;
>> +			break;
>> +
>> +		case NAND_OP_DATA_OUT_INSTR:
>> +			size = nand_subop_get_data_len(subop, op_id);
>> +			offset = nand_subop_get_data_start_off(subop, op_id);
>> +
>> +			cmd |= COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
>> +				COMMAND_TX | COMMAND_A_VALID;
>> +
>> +			memcpy(&reg, instr->ctx.data.buf.out + offset, size);
>> +			writel_relaxed(reg, ctrl->regs + RESP);
>> +
>> +			break;
>> +		case NAND_OP_WAITRDY_INSTR:
>> +			cmd |= COMMAND_RBSY_CHK;
>> +			break;
>> +
>> +		}
>> +	}
>> +
>> +	cmd |= COMMAND_GO | COMMAND_CE(ctrl->cur_cs);
>> +	writel_relaxed(cmd, ctrl->regs + COMMAND);
>> +	ret = wait_for_completion_io_timeout(&ctrl->command_complete,
>> +					     msecs_to_jiffies(500));
> 
> It's not obvious to me whether _io_ variant is appropriate to use here, would 
> be nice if somebody could clarify that. Maybe block/ already does the IO 
> accounting itself and hence the IO time would be counted twice in that case.

Good that you bring this up.

I don't think that there is any higher layer which could take care of
accounting. Usually, with raw nand there is no block layer involved
anyway.

In a quick test it seems that only when using wait_for_completion_io I/O
is properly accounted in the "wait" section of top.

So far only a single driver (omap2) used the _io variant, but I think it
is the right thing to do! After all, it is I/O...

Boris or any other MTD maintainer, any comment on this?

--
Stefan
