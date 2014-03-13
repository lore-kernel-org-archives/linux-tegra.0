From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH 1/2] ARM: DT: fix gic interrupt controller documentation
Date: Thu, 13 Mar 2014 12:25:54 -0600
Message-ID: <20140313182554.GA15990@obsidianresearch.com>
References: <1394732405-2260-1-git-send-email-tharvey@gateworks.com>
 <1394732405-2260-2-git-send-email-tharvey@gateworks.com>
 <5321EE81.1030207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5321EE81.1030207@wwwdotorg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Richard Zhu <r65037@freescale.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>, linux-pci@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>, Jingoo Han <jg1.han@samsung.com>, linux-tegra <linux-tegra@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 13, 2014 at 11:44:33AM -0600, Stephen Warren wrote:
> On 03/13/2014 11:40 AM, Tim Harvey wrote:
> > When using interrupt-maps, the size of a map entry is #address-cells +
> >  #interrupt-cells for the parent interrupt controller.  For the ARM GIC
> > address-cells should be 0 as this is not used.
> > 
> > This patch fixes the example by correctly specifying #address-cells = 0.
> 
> If the #address-cells property is required (well, or even optional...)
> in the node, shouldn't it be included in the list of required/optional
> properties above, and not solely included in the example?

AFAIK, #address-cells = 0 is the same as not including a
#address-cells at all.

Omitting entirely is what other interrupt-controller bindings are
doing, so I'd just drop mention of #address-cells completely.

Jason
