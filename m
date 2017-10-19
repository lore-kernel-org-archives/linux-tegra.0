From: Hermann Lauer <Hermann.Lauer@iwr.uni-heidelberg.de>
Subject: Re: Re: compile error in 4.14-rc5 with nvidia tegra enabled
Date: Thu, 19 Oct 2017 12:36:18 +0200
Message-ID: <20171019103618.anszbwgnrwv45vb5@lemon.iwr.uni-heidelberg.de>
References: <20171019084210.lql5kffhluvxvquu@lemon.iwr.uni-heidelberg.de>
 <d006a085-d81f-4632-35c9-4e9d607a6504@nvidia.com>
 <c3afe94a-a2eb-05c3-9838-ff1a4871736d@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <c3afe94a-a2eb-05c3-9838-ff1a4871736d@kapsi.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 19, 2017 at 01:21:02PM +0300, Mikko Perttunen wrote:
> Arnd Bergmann raised this issue previously[1], but I assumed it would only
> happen on some obscure configuration, as clearly arm tegra_defconfig and
> multi_v7_defconfig and arm64 defconfig are building.
> 
> It would be interesting to know how this is being triggered here.

basis is the config-4.13.0-1-armmp from Debian's sid linux-image package -
will send the exact config when I fetched it from the Allwinner A20 (BananaPro)
System. Toolchain is the Debian stretch toolchain.

Thanks for carering,
  Hermann

-- 
Netzwerkadministration/Zentrale Dienste, Interdiziplinaeres 
Zentrum fuer wissenschaftliches Rechnen der Universitaet Heidelberg
IWR; INF 205; 69120 Heidelberg; Tel: (06221)54-14405 Fax: -14427
Email: Hermann.Lauer@iwr.uni-heidelberg.de
