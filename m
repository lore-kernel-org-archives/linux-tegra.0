From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 02/11] ARM: tegra: add a flag for
 tegra_disable_clean_inv_dcache to do LoUIS or ALL
Date: Wed, 26 Jun 2013 13:31:00 -0600
Message-ID: <51CB4174.1050700@wwwdotorg.org>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
 <1372152475-18617-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1372152475-18617-3-git-send-email-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 06/25/2013 03:27 AM, Joseph Lo wrote:
> Adding a flag for tegra_disable_clean_inv_dcache to flush cache as LoUIS
> or ALL. After this patch, the v7_flush_dcache_louis is used for CPU hotplug
> and CPU suspend in CPU power down (e.g. CPU idle power-down mode) case. And
> the v7_flush_dcache_all is used for CPU cluster power down (e.g. suspend to
> LP2 mode).

> diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h

> +/* flag of tegra_disable_clean_inv_dcache to do LoUIS or all */
> +#define TEGRA_FLUSH_CACHE_LOUIS	0x10
> +#define TEGRA_FLUSH_CACHE_ALL	0x20

Is there a reason those two values aren't just 0 and 1; they only seem
to be used internally to switch between two function calls, and not
passed to those calls or written to HW.
