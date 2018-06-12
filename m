From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Tue, 12 Jun 2018 10:13:19 +0200
Message-ID: <20180612101319.528da20c@bbrezillon>
References: <20180611205224.23340-1-stefan@agner.ch>
        <20180611205224.23340-5-stefan@agner.ch>
        <2945591.o6hPPARSMh@dimapc>
        <fd15fcac50d25281fa8f7d97a738bf6a@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fd15fcac50d25281fa8f7d97a738bf6a@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Dmitry Osipenko <digetx@gmail.com>, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 12 Jun 2018 10:02:12 +0200
Stefan Agner <stefan@agner.ch> wrote:

> >> +static int tegra_nand_read_page_hwecc(struct mtd_info *mtd,
> >> +				      struct nand_chip *chip,
> >> +				      uint8_t *buf, int oob_required, int page)
> >> +{
> >> +	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
> >> +	struct tegra_nand_chip *nand = to_tegra_chip(chip);
> >> +	void *oob_buf = oob_required ? chip->oob_poi : 0;
> >> +	u32 dec_stat, max_corr_cnt;
> >> +	unsigned long fail_sec_flag;
> >> +	int ret;
> >> +
> >> +	tegra_nand_hw_ecc(ctrl, chip, true);
> >> +	ret = tegra_nand_page_xfer(mtd, chip, buf, oob_buf, nand->tag.length,
> >> +				   page, true);
> >> +	tegra_nand_hw_ecc(ctrl, chip, false);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* No correctable or un-correctable errors, page must have 0 bitflips */
> >> +	if (!ctrl->last_read_error)
> >> +		return 0;
> >> +
> >> +	/*
> >> +	 * Correctable or un-correctable errors occurred. Use DEC_STAT_BUF
> >> +	 * which contains information for all ECC selections.
> >> +	 *
> >> +	 * Note that since we do not use Command Queues DEC_RESULT does not
> >> +	 * state the number of pages we can read from the DEC_STAT_BUF. But
> >> +	 * since CORRFAIL_ERR did occur during page read we do have a valid
> >> +	 * result in DEC_STAT_BUF.
> >> +	 */
> >> +	ctrl->last_read_error = false;
> >> +	dec_stat = readl_relaxed(ctrl->regs + DEC_STAT_BUF);
> >> +
> >> +	fail_sec_flag = (dec_stat & DEC_STAT_BUF_FAIL_SEC_FLAG_MASK) >>
> >> +			DEC_STAT_BUF_FAIL_SEC_FLAG_SHIFT;
> >> +
> >> +	max_corr_cnt = (dec_stat & DEC_STAT_BUF_MAX_CORR_CNT_MASK) >>
> >> +		       DEC_STAT_BUF_MAX_CORR_CNT_SHIFT;
> >> +
> >> +	if (fail_sec_flag) {
> >> +		int bit, max_bitflips = 0;
> >> +
> >> +		/*
> >> +		 * Check if all sectors in a page failed. If only some failed
> >> +		 * its definitly not an erased page and we can return error
> >> +		 * stats right away.
> >> +		 *
> >> +		 * E.g. controller might return fail_sec_flag with 0x4, which
> >> +		 * would mean only the third sector failed to correct.

That works because you have NAND_NO_SUBPAGE_WRITE set (i.e. no partial
page programming), probably something you should state here.

> >> +		 */
> >> +		if (fail_sec_flag ^ GENMASK(chip->ecc.steps - 1, 0)) {
> >> +			mtd->ecc_stats.failed += hweight8(fail_sec_flag);
> >> +			return max_corr_cnt;
> >> +		}
> >> +
> >> +		/*
> >> +		 * All sectors failed to correct, but the ECC isn't smart
> >> +		 * enough to figure out if a page is really completely erased.
> >> +		 * We check the read data here to figure out if it's a
> >> +		 * legitimate ECC error or only an erased page.
> >> +		 */
> >> +		for_each_set_bit(bit, &fail_sec_flag, chip->ecc.steps) {
> >> +			u8 *data = buf + (chip->ecc.size * bit);
> >> +
> >> +			ret = nand_check_erased_ecc_chunk(data, chip->ecc.size,
> >> +							  NULL, 0,

You should also check that the ECC bytes are 0xff here, otherwise you
won't detect corruption of pages almost filled 0xff but with a few bits
set to 0.

When you use nand_check_erased_ecc_chunk(), it's important to always
pass the data along with its associated ECC bytes.

> >> +							  NULL, 0,

If you support writing extra OOB bytes, you should also pass them here.

> >> +							  chip->ecc.strength);
> >> +			if (ret < 0)
> >> +				mtd->ecc_stats.failed++;
> >> +			else
> >> +				max_bitflips = max(ret, max_bitflips);
> >> +		}
> >> +
> >> +		return max_t(unsigned int, max_corr_cnt, max_bitflips);
> >> +	} else {
> >> +		int corr_sec_flag;
> >> +
> >> +		corr_sec_flag = (dec_stat & DEC_STAT_BUF_CORR_SEC_FLAG_MASK) >>
> >> +				DEC_STAT_BUF_CORR_SEC_FLAG_SHIFT;
> >> +
> >> +		/*
> >> +		 * The value returned in the register is the maximum of
> >> +		 * bitflips encountered in any of the ECC regions. As there is
> >> +		 * no way to get the number of bitflips in a specific regions
> >> +		 * we are not able to deliver correct stats but instead
> >> +		 * overestimate the number of corrected bitflips by assuming
> >> +		 * that all regions where errors have been corrected
> >> +		 * encountered the maximum number of bitflips.
> >> +		 */
> >> +		mtd->ecc_stats.corrected += max_corr_cnt * hweight8(corr_sec_flag);
> >> +
> >> +		return max_corr_cnt;
> >> +	}
> >> +  
