From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] soc/tegra: Add generic PM domain support
Date: Mon, 09 May 2016 16:29:03 +0200
Message-ID: <4251738.3YkFNHn2NH@wuerfel>
References: <1461946869-26124-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461946869-26124-1-git-send-email-thierry.reding@gmail.com>
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
Cc: Alexandre Courbot <gnurou@gmail.com>, arm@kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Friday 29 April 2016 18:21:06 Thierry Reding wrote:
> soc/tegra: Add generic PM domain support
> 
> Implements generic PM domain support on top of the existing Tegra power-
> gate API. Drivers are thus allowed to move away from the Tegra-specific
> API and towards using generic power domains directly.
> 
> 

Merged into next/drivers, thanks!

	Arnd
