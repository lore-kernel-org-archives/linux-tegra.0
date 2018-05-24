From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [RESEND PATCH 2/5] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Thu, 24 May 2018 13:53:35 +0200
Message-ID: <20180524135335.6aa0b7a4@bbrezillon>
References: <cover.1526990589.git.stefan@agner.ch>
        <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
        <CAGefG55kvShaLhNYsFznbOq0_6RNbb+eJ47DLnnU9qRRpwu-iA@mail.gmail.com>
        <d8d6cb9fcd8ce7ea5c13b227012de6d2@agner.ch>
        <CAGefG56khQ2835c2QCteit7FuL_yG+APpj6-4vRRPxztFtkAMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGefG56khQ2835c2QCteit7FuL_yG+APpj6-4vRRPxztFtkAMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Lindqvist <benjamin.lindqvist@endian.se>
Cc: Stefan Agner <stefan@agner.ch>, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, Lucas Stach <dev@lynxeye.de>, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, Mirza Krak <mirza.krak@gmail.com>, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Benjamin,

On Thu, 24 May 2018 13:30:14 +0200
Benjamin Lindqvist <benjamin.lindqvist@endian.se> wrote:

> Hi Stefan,
> 
> It seems to me that a probe similar to what the BootROM does shouldn't
> be awfully complicated to implement - just cycle through the switch
> cases in case of an ECC error. But I guess that's more of an idea for
> further improvements rather than a comment to the patch set under
> review.

Nope, not really an option, because you're not guaranteed that the NAND
will be used as a boot media, and the first page or first set of pages
might just be erased.

> 
> However, I think that allowing for an override of the oobsize
> inference would be a good idea before merging, no? This could just be
> a trivial #ifdef (at least temporarily). If you agree but don't feel
> like doing it yourself, I'd be happy to pitch in. Let me know.

That's why we have nand-ecc-xxx properties in the DT.

Regards,

Boris
