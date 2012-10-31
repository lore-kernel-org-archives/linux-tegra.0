From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH REPOST] usb: host: tegra remove include of <mach/iomap.h>
Date: Wed, 31 Oct 2012 10:17:13 -0600
Message-ID: <50914F09.6000404@wwwdotorg.org>
References: <1351106941-869-1-git-send-email-swarren@wwwdotorg.org> <508EB654.8030502@wwwdotorg.org> <20121031125131.GJ10998@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121031125131.GJ10998-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/31/2012 06:51 AM, Felipe Balbi wrote:
> Hi,
> 
> On Mon, Oct 29, 2012 at 11:01:08AM -0600, Stephen Warren wrote:
>> On 10/24/2012 01:29 PM, Stephen Warren wrote:
>>> Almost nothing from this file is used, and the file will
>>> hopefully be deleted soon. Copy the tiny portions that are used
>>> directly into ehci-tegra.c. I believe that Venu Byravarasu is
>>> working on cleaning up our USB driver, and those cleanups will
>>> remove the need for these constants.
>> 
>> Per suggestion from Greg, I have applied this to the Tegra tree
>> for 3.8.
> 
> so I need not take this patch in my tree, right ?
> 
> just making sure.

I'm fairly sure you'll want to have the patch in your tree too; Greg's
suggestion was simply to merge it everywhere it was needed.

To summarize:

* I've applied the patch to the Tegra tree since it's a dependency for
some cleanup.

* I think it's needed in whichever USB tree(s) will take the
forthcoming Tegra PHY driver rework. Apparently that's your PHY tree.
This is however simply to avoid any merge conflicts. If the PHY driver
rework ends up not adding any extra includes of <mach/iomap.h>
(unlikely if new files are added) then perhaps it isn't needed. Also,
if the PHY driver rework ends up not re-arranging the includes a lot,
then perhaps it will merge OK without you needing the patch. If you
want, perhaps the best course of action is to hold off applying the
patch until the PHY driver rework patches appear, and it's obvious
whether there will be a hard-to-resolve conflict, and only apply the
patch if strictly needed to avoid sticky merge conflicts.

* Greg has taken both patches into his USB tree already. Does
development process allow you to simply merge that?
