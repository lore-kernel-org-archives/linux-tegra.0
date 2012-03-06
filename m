From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH/RFC 1/2] arm/tegra: fix harmony pinmux for PCIe
Date: Tue, 06 Mar 2012 09:55:12 -0700
Message-ID: <4F564170.7000209@wwwdotorg.org>
References: <1331023544-6439-1-git-send-email-mad_soft@inbox.ru>
 <1331023544-6439-2-git-send-email-mad_soft@inbox.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331023544-6439-2-git-send-email-mad_soft@inbox.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dmitry Artamonow <mad_soft@inbox.ru>
Cc: Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, Mike Rapoport <mike@compulab.co.il>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 03/06/2012 01:45 AM, Dmitry Artamonow wrote:
> Commit 6e96aca397 (arm/tegra: Harmony PCIe: Don't touch pinmux)
> removed runtime tri-state toggling for PCIe related pinmux groups,
> but it seems that the fact that all of them are tri-state by default
> has been overlooked. Change defaults for these groups to TEGRA_TRI_NORMAL.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>

Crap, why didn't I check that? Anyway,

Acked-by: Stephen Warren <swarren@wwwdotorg.org>
