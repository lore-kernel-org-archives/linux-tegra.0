From: Paul Walmsley <pwalmsley@nvidia.com>
Subject: Re: [PATCH stable] ARM: tegra: unify Tegra's Kconfig a bit more
Date: Sun, 6 Oct 2013 23:18:47 -0700
Message-ID: <52525247.9060609@nvidia.com>
References: <1380917411-25869-1-git-send-email-swarren@wwwdotorg.org> <20131005233833.GA18223@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20131005233833.GA18223@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Greg,

On 10/05/2013 04:38 PM, Greg KH wrote:
> On Fri, Oct 04, 2013 at 02:10:11PM -0600, Stephen Warren wrote:
>> [auto-builders for 3.11.x are failing due to this]
> What autobuilders?  I haven't heard of this before.

There's an experimental system here that automatically builds and 
test-boots -stable kernels on some Tegra platforms.  The output isn't 
public yet -- that's planned, but there are still a few bugs left in the 
test system that would be good to clean up first.

The output is similar to this:

http://nvt.pwsan.com/pub/linux/testlogs/

Will certainly send you a link when it's ready to go.


- Paul
