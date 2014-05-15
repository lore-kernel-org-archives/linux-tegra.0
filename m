From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC PATCH 05/10] ARM: tegra: Export function to read USB calibration
 data
Date: Thu, 15 May 2014 14:39:07 -0600
Message-ID: <537525EB.9090704@wwwdotorg.org>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org> <1400113986-339-6-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400113986-339-6-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Mathias Nyman <mathias.nyman@intel.com>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On 05/14/2014 06:33 PM, Andrew Bresticker wrote:
> Board-specific USB configuration data is stored in FUSE_SKU_CALIB_0.
> Export a function to read it so the PHY can be properly configured.

This patch seems conceptually fine to me. Presumably once Peter's fuse
driver is fleshed out, it can expose the exact same semantic interface
to drivers.

I suppose one could argue that we should create/use an explicit fuse
subsystem with a standard API that drivers can call into, rather than a
custom API. We can get the appropriate handle to use for that API from a
phandle (plus fuse IDs?) in a DT property (in the XHCI device node,
pointing at the fuse device node) much like any other cross-device
resource reference. I'm not too bothered whether the code actually does
that in the first instance, although we should make sure we add that DT
property (containing all required fuse ID information) so that the code
/can/ work that way if we want it to in the future.
