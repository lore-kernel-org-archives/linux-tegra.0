From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] arm: tegra124: remove commas from unit addresses
Date: Mon, 20 Jun 2016 10:45:55 -0600
Message-ID: <57681DC3.9090801@wwwdotorg.org>
References: <1466298275-15753-1-git-send-email-marcel.ziswiler@toradex.com>
 <576810C2.1030401@wwwdotorg.org> <20160620164057.GD6175@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160620164057.GD6175@ulmo.ba.sec>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 06/20/2016 10:40 AM, Thierry Reding wrote:
> On Mon, Jun 20, 2016 at 09:50:26AM -0600, Stephen Warren wrote:
>> On 06/18/2016 07:04 PM, Marcel Ziswiler wrote:
>>> Remove commas from unit addresses as suggested by Rob Herring upon me
>>> posting initial Apalis TK1 support:
>>>
>>> http://article.gmane.org/gmane.linux.ports.tegra/26608
>>
>> Acked-by: Stephen Warren <swarren@nvidia.com>
>
> I'm confused now. I posted almost exactly the same patch a while ago and
> we agreed that we couldn't do this because the node names were to be
> considered part of the ABI.
>
> Is it or is it not?

The particular case where it matters is the GPU node, which U-Boot 
manipulates. This revised patch version no longer renames the GPU node 
and so in practice avoids any issues that I'm aware of.

If there's a more general rule that node names are part of the ABI, then 
indeed we shouldn't take this patch.
