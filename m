From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v8 0/6] efuse driver for Tegra
Date: Thu, 12 Jun 2014 16:17:02 -0600
Message-ID: <539A26DE.8050609@wwwdotorg.org>
References: <1402587400-1544-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1402587400-1544-1-git-send-email-pdeschrijver@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>, Paul Gortmaker <paul.gortmaker@windriver.com>, Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, linux-doc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Tejun Heo <tj@kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>, Greg Kroah-Hartman <gregkh@linuxf>
List-Id: linux-tegra@vger.kernel.org

On 06/12/2014 09:36 AM, Peter De Schrijver wrote:
> This driver allows userspace to read the raw efuse data. Its userspace
> interface is modelled after the sunxi_sid driver which provides similar
> functionality for some Allwinner SoCs. It has been tested on
> Tegra20 (ventana), Tegra30 (beaverboard), Tegra114 (dalmore) and
> Tegra124 (jetson TK1).

I think this series looks OK now. However, I noticed one change in
behaviour that I don't think is expected:

The current code/DTB print:
Tegra Revision: A01 SKU: 0 CPU Process: 0 Core Process: 0

However, applying these patches and booting yields:
Tegra Revision: A01 SKU: 0 CPU Process: 1 Core Process: 1
