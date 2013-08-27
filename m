From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH RFC v2 01/16] ARM: call clk_of_init from time_init
Date: Tue, 27 Aug 2013 15:19:46 -0700
Message-ID: <3837b119-baad-4e68-8805-2bc52c0135f9@DB9EHSMHS031.ehs.local>
References: <1376964271-22715-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1377638890-371-2-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1377638890-371-2-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org, kernel@stlinux.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 27, 2013 at 11:27:55PM +0200, Sebastian Hesselbarth wrote:
> Most DT ARM machs require common clock providers initialized before t=
imers.
> Currently, arch/arm machs use .init_time to call clk_of_init right be=
fore
> clocksource_of_init. This prevents to remove that hook and use the de=
fault
> hook instead. clk_of_init is safe to call for non-DT platforms, so ad=
d
> the call to ARM arch time_init by default. While at it, also reorder =
includes
> alphabetically.
>=20
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com=
>
> ---
> Changelog:
> v1->v2:
> - reorder includes alphabetically
>=20
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-tegra@vger.kernel.org
> Cc: kernel@stlinux.com
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/kernel/time.c |   24 ++++++++++++++----------
>  1 files changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/arm/kernel/time.c b/arch/arm/kernel/time.c
> index 98aee32..dd1028e 100644
> --- a/arch/arm/kernel/time.c
> +++ b/arch/arm/kernel/time.c
> @@ -11,25 +11,26 @@
[ ... ]
>  void __init time_init(void)
>  {
> +	/* initalize common clocks before timers */
> +	of_clk_init(NULL);
> +
>  	if (machine_desc->init_time)
>  		machine_desc->init_time();
>  	else

This forces zynq to move some initialization our clock code relies on t=
o
init_irq(). Also, the current code already takes an approach of
doing either common init or machine specific init.
I think it might be better to move the call to of_clk_init() down into
the else branch of the if-else.
Though, this probably contradicts the purpose of the whole series.

	S=C3=B6ren
