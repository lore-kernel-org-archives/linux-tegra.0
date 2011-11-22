From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 5/5] arm/dt: tegra: Fix SDHCI nodes to match board files
Date: Tue, 22 Nov 2011 09:38:02 +0100
Message-ID: <20111122083802.GK21480@game.jcrosoft.org>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
 <1321911851-10091-5-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1321911851-10091-5-git-send-email-swarren@nvidia.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Marc Dietrich <marvin24@gmx.de>, linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 14:44 Mon 21 Nov     , Stephen Warren wrote:
> Mark any SDHCI controllers that aren't registered by the board files as
> disabled in the device-tree files.
> 
> In practice, these controllers:
> 
> * Have nothing hooked up to them at all, or
> * For ports intended for SDIO usage, the drivers for anything that might
>   be attached are not in the device-tree yet. If/when drivers appear, the
>   SD/MMC port can be re-enabled.
> 
> The only possible exception is TrimSlice's mico SD slot, but that wasn't
> enabled in the board files before anyway, and doesn't work when all the
> SDHCI controllers are enabled anyway.
it will be better to invert the logic

just enable what you are supposed too

Best Regards,
J.
