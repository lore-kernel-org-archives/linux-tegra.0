From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH][next] mtd: rawnand: fix a couple of spelling mistakes
Date: Sun, 1 Jul 2018 20:14:26 +0200
Message-ID: <20180701201426.33d5bd90@xps13>
References: <20180626102629.31083-1-colin.king@canonical.com>
        <93be5d64cc447fb282bcc14fed853f0c@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <93be5d64cc447fb282bcc14fed853f0c@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Colin,

> On 26.06.2018 12:26, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Trival fix of two spelling mistakes in dev_err error messages:
> > "supportes" -> "supports" and "strenght" -> "strength"  
> 
> Acked-by: Stefan Agner <stefan@agner.ch>
> 
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---

Thanks for fixing this, I squashed this change with the patch adding
the driver itself.

Thanks,
Miquèl
