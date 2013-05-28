From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: rebuild tegra_defconfig
Date: Tue, 28 May 2013 15:30:29 -0600
Message-ID: <51A521F5.2010206@wwwdotorg.org>
References: <1369761972-31986-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1369761972-31986-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 05/28/2013 11:26 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> This simply rebuilds tegra_defconfig on top of next-20130520. As such, it
> should introduce no changes; simply moving entries around due to Kconfig
> ordering changes. The apparent exceptions are:
> 
> AUTO_ZRELADDR: Selected by ARM multi-platform support.
> MTD_CHAR: Removed in Kconfig.
> 
> This should make it easier to create future defconfig patches on top of
> linux-next, since all the extraneous diffs have been removed. It also
> makes it more likely that once 3.12 comes around, this defconfig will
> already match what's required there.

I've applied this (squashed it into) Tegra's for-3.11/defconfig branch.
