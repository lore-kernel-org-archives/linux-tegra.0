From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 12/32] PCI/ARM: use PCIe capabilities access functions
 to simplify implementation
Date: Wed, 01 Aug 2012 11:20:13 -0600
Message-ID: <5019654D.2000408@wwwdotorg.org>
References: <1343836477-7287-1-git-send-email-jiang.liu@huawei.com> <1343836477-7287-13-git-send-email-jiang.liu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1343836477-7287-13-git-send-email-jiang.liu@huawei.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jiang Liu <liuj97@gmail.com>, Thierry Reding <thierry.reding@avionic-design.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Don Dutile <ddutile@redhat.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Jiang Liu <jiang.liu@huawei.com>, Yinghai Lu <yinghai@kernel.org>, Taku Izumi <izumi.taku@jp.fujitsu.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>, Yijing Wang <wangyijing@huawei.com>, Russell King <linux@arm.linux.org.uk>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/01/2012 09:54 AM, Jiang Liu wrote:
> From: Jiang Liu <jiang.liu@huawei.com>
> 
> Use PCIe capabilities access functions to simplify PCIe ARM implementation.
> 
> Signed-off-by: Jiang Liu <liuj97@gmail.com>

This is probably fine from my perspective assuming the underlying PCI
API implementation is OKd by relevant people.

Thierry, can you comment on whether this will conflict with your Tegra
PCIe driver series? If it doesn't, this patch can go through any
relevant PCI tree. If it does, we may have to take this through the
Tegra tree after merging the dependencies, or defer it to later.
