From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T
 kernel_noload
Date: Wed, 29 Feb 2012 13:29:42 +0100
Message-ID: <20120229122942.GF3318@game.jcrosoft.org>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1330473804-23348-1-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 17:03 Tue 28 Feb     , Stephen Warren wrote:
> uImage files typically encode a single absolute load and entry address.
> This is inconvenient when attempting to share that uImage across multiple
> SoCs with different physical RAM addresses. Recent versions of mkimage
> implement a "kernel_noload" image type which encodes no absolute load
> address, and a relative entry address. This works well for uImage-wrapped
> ARM zImages, since they are relocatable.
> 
> This is enabled by commit b9b50e89d317c58becd0e2d7fac2e21e3a81dd0a
> "image: Implement IH_TYPE_KERNEL_NOLOAD" in U-Boot.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> I assume I should put this into the ARM patch tracker if it's OK?
Again a new option for uImage no why not just boot the zImage

in this case the uImage is useless

Best Regards,
J.
