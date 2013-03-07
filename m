From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix ignored return value of regulator_enable
Date: Thu, 07 Mar 2013 13:31:40 -0700
Message-ID: <5138F92C.2010107@wwwdotorg.org>
References: <1362615385-13418-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362615385-13418-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2013 05:16 PM, Stephen Warren wrote:
> This fixes:
>=20
> arch/arm/mach-tegra/board-harmony-pcie.c: In function =E2=80=98harmon=
y_pcie_init=E2=80=99:
> arch/arm/mach-tegra/board-harmony-pcie.c:65:18: warning: ignoring ret=
urn
>     value of =E2=80=98regulator_enable=E2=80=99, declared with attrib=
ute
>     warn_unused_result [-Wunused-result]

I've applied this to Tegra's for-3.10/fixes branch.
