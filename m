From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] ARM: pci: Keep pci_common_init() around after init
Date: Thu, 07 Feb 2013 02:20:05 +0100
Message-ID: <2957343.pp7RNnqk54@wuerfel>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <9348609.HjKCmL9u9S@wuerfel>
 <CACRpkdYGgdMTi0ZeMeCk5UmrndD451Pyz8L_XE=y9SPXfGGdew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYGgdMTi0ZeMeCk5UmrndD451Pyz8L_XE=y9SPXfGGdew@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Russell King <linux@arm.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Murray <andrew.murray@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 06 February 2013 18:07:53 Linus Walleij wrote:
> However it leaves the question of how much __init, __initdata
> and __initconst we have littering around. Oh, well, we'll see
> I guess.

Actually, kbuild is pretty good at warning around the
bugs there.

	Arnd
