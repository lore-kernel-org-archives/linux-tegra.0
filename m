From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
Date: Thu, 25 Jul 2019 12:55:02 +0300
Message-ID: <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
> 
> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
> doesn't sound correct to me. Something like 'firmware_sc7' should suit
> better here.
> 
> > +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> 
> Secondly, I'm also not sure why COP interrupts need to be disabled for
> pre-T210 at all, since COP is unused. This looks to me like it was
> cut-n-pasted from downstream kernel without a good reason and could be
> simply removed.

I don't think we can rely on the fact that COP is unused. People can
write their own code to run on COP.

Peter.
