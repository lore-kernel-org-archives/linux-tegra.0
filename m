From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] usb: move phy driver from mach-tegra to drivers/usb
Date: Wed, 12 Sep 2012 09:29:56 -0600
Message-ID: <5050AA74.6050408@wwwdotorg.org>
References: <1346851223-29180-1-git-send-email-vbyravarasu@nvidia.com> <504F681E.4070402@wwwdotorg.org> <20120912134919.GR5732@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120912134919.GR5732@arwen.pp.htv.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: Venu Byravarasu <vbyravarasu@nvidia.com>, linux-kernel@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 09/12/2012 07:49 AM, Felipe Balbi wrote:
> On Tue, Sep 11, 2012 at 10:34:38AM -0600, Stephen Warren wrote:
>> On 09/05/2012 07:20 AM, Venu Byravarasu wrote:
>>> As part of this patch: 1. Moved existing tegra phy driver to
>>> drivers/USB directory. 2. Added standard USB phy driver APIs to
>>> tegra phy driver.
>>> 
>>> Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com>
>> 
>> Felipe,
>> 
>> I see this patch hasn't been applied yet. Can I ask that it be
>> deferred to 3.8 rather than being applied for 3.7. The reason is
>> that in 3.7, I want to add a new include of the header that this
>> patch moves, and without merging the Tegra and USB PHY trees
>> together, the two patches together would cause a build break.
>> Now, it's a little late to merge the branches, since I need to
>> send my pull requests in about 3 days, so they hit arm-soc by
>> 3.6-rc6.
> 
> According to git I've applied this on September 5th:
> 
> http://git.kernel.org/?p=linux/kernel/git/balbi/usb.git;a=commit;h=1ba8216f0bc02af6ba70d1108d60eb1b064395e4

Sorry,
> 
I had not noticed that; that branch isn't in linux-next, and I
didn't see any email notification that the patch was applied.

As discussed off-list, I'll resolve this by rebasing the relevant
Tegra branch on top of your xceiv branch's pull request tag. Sorry for
the confusion.
