From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Add HWMON INA3221 support
Date: Mon, 3 Jun 2019 14:17:46 -0700
Message-ID: <20190603211745.GA21855@Asurada-Nvidia.nvidia.com>
References: <20190424181010.28950-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190424181010.28950-1-nicoleotsuka@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: treding@nvidia.com
Cc: linux-tegra@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 24, 2019 at 11:10:10AM -0700, Nicolin Chen wrote:
> Tegra186 board under arm64 is using this device, according to
> its dts file. So this patch enables its driver with a "=m" as
> the other HWMON drivers.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Sorry to ping this patch. But I am wondering if I sent it wrong
-- had been missing some other reviewers or maillists. May some
one kindly remind me?

Thank you
Nicolin

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 04cc2a2adc39..00043e706399 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -424,6 +424,7 @@ CONFIG_SENSORS_LM90=m
>  CONFIG_SENSORS_PWM_FAN=m
>  CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>  CONFIG_SENSORS_INA2XX=m
> +CONFIG_SENSORS_INA3221=m
>  CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
>  CONFIG_CPU_THERMAL=y
>  CONFIG_THERMAL_EMULATION=y
> -- 
> 2.17.1
> 
