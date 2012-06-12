From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 06/10] ARM: tegra: pcie: Add MSI support
Date: Mon, 11 Jun 2012 23:33:58 -0600
Message-ID: <4FD6D4C6.2080201@wwwdotorg.org>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de> <1339427118-32263-7-git-send-email-thierry.reding@avionic-design.de> <4FD660F9.7030807@wwwdotorg.org> <20120612050713.GB3669@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20120612050713.GB3669@avionic-0098.mockup.avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-tegra@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-pci@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>
List-Id: linux-tegra@vger.kernel.org

On 06/11/2012 11:07 PM, Thierry Reding wrote:
> * Stephen Warren wrote:
>> On 06/11/2012 09:05 AM, Thierry Reding wrote:
>>> This commit adds support for message signaled interrupts to the
>>> Tegra PCIe controller. Based on code by Krishna Kishore
>>> <kthota@nvidia.com>.
...
>> Why allocate pcie->msi separately; why not include the fields
>> directly into struct tegra_pcie_info *pcie?
...
> Second, and more importantly, this will keep the size of struct 
> tegra_pcie_info smaller if PCI_MSI is not selected because there is
> just one unused pointer instead of five unused fields.

Well, you can always ifdef out the structure fields too, right?
