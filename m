From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Thu, 12 Nov 2015 09:04:22 -0800
Message-ID: <20151112170422.GC3605@xsjsorenbubuntu>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <alpine.DEB.2.11.1511101017190.3915@nanos>
 <56421421.8070807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56421421.8070807@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

On Tue, 2015-11-10 at 03:58PM +0000, Jon Hunter wrote:
> Hi Thomas,
>=20
> On 10/11/15 15:26, Thomas Gleixner wrote:
[...]
> > Can you folks please agree on something which is correct and comple=
te?
>=20
> Soren I am happy to defer to your patch and drop this. My only commen=
t
> would be what about the request_percpu_irq() path in your patch?

Sorry, I couldn't spent any time on this the last days. And now it seem=
s
you are already a lot closer to a solution than the initial patches wer=
e.
I'm happy to step back from this patch set, but I'd appreciate if you
kept me in the loop.

	Thanks,
	S=C3=B6ren
