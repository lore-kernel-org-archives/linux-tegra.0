From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 4/4] usb: Add APIs to access host registers from Tegra
 PHY
Date: Thu, 17 Jan 2013 15:18:43 -0700
Message-ID: <50F878C3.9030002@wwwdotorg.org>
References: <1358411292-12288-1-git-send-email-vbyravarasu@nvidia.com> <20130117090255.GD10814@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130117090255.GD10814@arwen.pp.htv.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: Venu Byravarasu <vbyravarasu@nvidia.com>, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/17/2013 02:02 AM, Felipe Balbi wrote:
> Hi,
> 
> On Thu, Jan 17, 2013 at 01:58:12PM +0530, Venu Byravarasu wrote:
>> As Tegra PHY driver need to access one of the Host registers, 
>> added few APIs to ehci tegra driver.
>> 
>> Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com>
> 
> Stephen is this another of those patches you're gonna take care of 
> yourself ?

Yes; in kernel 3.9, I believe I need to take any significant Tegra
EHCI or PHY patches through the Tegra tree due to the need to change
the Tegra device trees in lock-step with some of the code changes, and
other Tegra-related changes also changing the USB-related nodes in
device tree e.g. to add clocks properties.

Hopefully we get enough USB patches into 3.9 that the dependencies are
then removed, and we can revert back to the usual merging path in 3.10...
