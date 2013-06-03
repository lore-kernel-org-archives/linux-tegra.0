From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: tegra: remove the ifdef of ARCH SoC in the
 tegra_resume
Date: Tue, 4 Jun 2013 00:48:13 +0200
Message-ID: <201306040048.13612.arnd@arndb.de>
References: <1370247004-31846-1-git-send-email-josephl@nvidia.com>
 <51ACB59D.9030005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51ACB59D.9030005@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 03 June 2013, Stephen Warren wrote:
> Was that ifdef completely incorrect before? I can see why the cmp/beq
> might be ifdef'd (although it's not worth it), but I assume the code
> after that beq was intended to run on all chips after Tegra20. The ifdef
> as it was written does something rather different; it prevents any of
> that code from running unless the kernel doesn't have Tegra20 support.
> So, I think that the removal of the ifdef is more of a bug-fix that
> "because we always build with all Tegra SoCs support. Let me know, and
> I'll re-write the commit description to something more accurate...

The #ifdef was recently changed from #if TEGRA3 to #if !TEGRA2, which support
for TEGRA4 was added. I think this is where it broke.

	Arnd
