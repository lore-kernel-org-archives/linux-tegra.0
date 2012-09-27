From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Thu, 27 Sep 2012 07:37:15 +0200
Message-ID: <20120927053715.GK17667@game.jcrosoft.org>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

HI,

	what happend on the patch serie taht use the fdt to do the same

Best Regards,
J.
On 16:46 Tue 25 Sep     , Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Tegra's uncompress and debug-macro.S communicate to each-other. Hence,
> we can't be left without uncompress.h in a multi-platform enabled kernel,
> or we'll lose features. This series allows uncompress.h to be used in a
> multi-platform kernel, restores the mvebu uncompress.h, and finally moves
> the Tegra debug macros into the common location. The series as mainly an
> RFC due to the outstanding question of where to put Tegra's <mach/iomap.h>
> in the final patch.
> 
> Stephen Warren (3):
>   ARM: move ICEDCC uncompress.h to common location
>   ARM: mvebu: restore uncompress.h
>   ARM: tegra: move debug macros to include/debug
> 
>  arch/arm/Kconfig.debug                             |   20 ++++++
>  arch/arm/boot/compressed/misc.c                    |   64 +-------------------
>  arch/arm/include/debug/icedcc-uncompress.h         |   61 +++++++++++++++++++
>  arch/arm/include/debug/mvebu-uncompress.h          |   43 +++++++++++++
>  arch/arm/include/debug/none-uncompress.h           |    3 +
>  .../debug/tegra-uncompress.h}                      |    6 +-
>  .../mach/debug-macro.S => include/debug/tegra.S}   |    6 +-
>  7 files changed, 132 insertions(+), 71 deletions(-)
>  create mode 100644 arch/arm/include/debug/icedcc-uncompress.h
>  create mode 100644 arch/arm/include/debug/mvebu-uncompress.h
>  create mode 100644 arch/arm/include/debug/none-uncompress.h
>  rename arch/arm/{mach-tegra/include/mach/uncompress.h => include/debug/tegra-uncompress.h} (98%)
>  rename arch/arm/{mach-tegra/include/mach/debug-macro.S => include/debug/tegra.S} (96%)
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
