From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] ARM: tegra: expose chip ID and revision
Date: Wed, 13 Mar 2013 11:45:52 -0600
Message-ID: <5140BB50.8080004@wwwdotorg.org>
References: <1363168080-12697-1-git-send-email-dahuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1363168080-12697-1-git-send-email-dahuang@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Danny Huang <dahuang@nvidia.com>
Cc: linux@arm.linux.org.uk, thierry.reding@avionic-design.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ldewangan@nvidia.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, hdoyu@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 03/13/2013 03:48 AM, Danny Huang wrote:
> Expose Tegra chip ID and revision in /sys/devices/soc for user mode
> usage

> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c

>  static void __init tegra_dt_init(void)
>  {
> +	struct device *parent = NULL;
> +	struct soc_device *soc_dev;
> +	struct soc_device_attribute *soc_dev_attr;

Since Russell asked you to redo the patch anyway, I'd prefer that
variables be declared in the order they're used. So, soc_dev_attr, then
soc_dev, then parent.
