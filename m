From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] PCI: PM: Skip devices in D0 for suspend-to-idle
Date: Wed, 26 Jun 2019 13:58:43 +0300
Message-ID: <20190626105843.GQ2640@lahna.fi.intel.com>
References: <1668247.RaJIPSxJUN@kreacher>
 <CAJZ5v0hdtXqoK84DpYtyMSCnkR9zOHFiUPAzWZDtkFmEjyWD1g@mail.gmail.com>
 <CAJZ5v0gGdXmgc_9r2rbiadq4e31hngpjYQ40QoC6C0z19da_hQ@mail.gmail.com>
 <2287147.DxjcvLeq6l@kreacher>
 <CAJZ5v0gU9OedmZBNDGefG3GjS7FHRmgQ67eOcr2vXRrAg3zZbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gU9OedmZBNDGefG3GjS7FHRmgQ67eOcr2vXRrAg3zZbg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Keith Busch <kbusch@kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 25, 2019 at 06:23:46PM +0200, Rafael J. Wysocki wrote:
> > So I wonder if the patch below makes any difference?
> 
> Mika, can you please test this one in combination with the other
> changes we've been working on?

Sure, I'll give it a try shortly.
