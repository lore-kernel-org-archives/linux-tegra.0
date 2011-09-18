From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] arm/dt: Add SoC detection macros
Date: Sun, 18 Sep 2011 02:46:15 +0200
Message-ID: <20110918004615.GC16141@game.jcrosoft.org>
References: <1315555339-12685-1-git-send-email-amartin@nvidia.com>
	<20110917112321.GE16381@n2100.arm.linux.org.uk>
	<20110917181907.GA16141@game.jcrosoft.org>
	<3353131.FJY7smc8i5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <3353131.FJY7smc8i5@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-tegra@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 22:56 Sat 17 Sep     , Arnd Bergmann wrote:
> On Saturday 17 September 2011 20:19:07 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > 
> > I agree about it I just mean that if you have the same board with 2 SoC which
> > are pin to pin compatible detect the soc type will be usefull as the soc
> > resource may not be the same
> 
> In that scenario, you would put all SOC specific data into one .dtsi
> file and all board data into another .dtsi file and then create a
> description for the combination using a trivial .dts file with two
> include statements. This is all solved outside of the kernel already,
> so there is no need for infrastructure in the kernel.
except in this case you must have 2 machine id which can be avoided if you can
detect the soc at kernel level

Best Regards,
J.
