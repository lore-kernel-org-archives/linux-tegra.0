From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 07/16] ARM: l2c: convert tegra to generic l2c
 initialisation
Date: Mon, 28 Apr 2014 11:28:00 -0600
Message-ID: <535E8FA0.6040205@wwwdotorg.org>
References: <20140428165631.GM26756@n2100.arm.linux.org.uk>
 <E1Weoso-0002Pj-LE@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1Weoso-0002Pj-LE@rmk-PC.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 04/28/2014 10:58 AM, Russell King wrote:

> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c

>  DT_MACHINE_START(TEGRA_DT, "NVIDIA Tegra SoC (Flattened Device Tree)")
> -	.map_io		= tegra_map_common_io,
>  	.smp		= smp_ops(tegra_smp_ops),
> +	.l2c_aux_val	= 0x3c400001,
> +	.l2c_aux_mask	= 0xc20fc3fe,
> +	.map_io		= tegra_map_common_io,

I'm not sure why .map_io was moved. Was it to sort the entries in order
of execution? If so, I assume that .smp should be moved too?
