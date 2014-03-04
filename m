From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 4/5] mfd: palmas: support IRQ inversion at the board
 level
Date: Tue, 4 Mar 2014 16:25:12 +0800
Message-ID: <20140304082512.GF10579@lee--X1>
References: <1393876300-3061-1-git-send-email-swarren@wwwdotorg.org>
 <1393876300-3061-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393876300-3061-4-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

> From: Stephen Warren <swarren@nvidia.com>
>=20
> Implement the new DT property ti,irq-externally-inverted, and add an
> equivalent platform data field to match. This allows the driver to
> correctly automatically configure the IRQ output polarity when the bo=
ard
> or SoC contains an inverter between the Palmas IRQ output and IRQ
> controller input.
>=20
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v3:
> * Use an IRQD flag to represent the data, rather than a custom DT pro=
perty.
> v2:
> * Split V1's patch 1/2 into separate patches 1/3 and 2/3.
> ---
>  drivers/mfd/palmas.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Looks good to me. Let me know how you want to deal with this. I'm
happy to create an immutable branch for everyone to pull from.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
