From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/9] Tegra USB cleanup series
Date: Wed, 24 Jul 2013 10:03:26 -0700
Message-ID: <51F008DE.50308@wwwdotorg.org>
References: <1372455427-20898-1-git-send-email-ttynkkynen@nvidia.com> <51D1FCBD.6070104@wwwdotorg.org> <20130724123229.GE17962@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130724123229.GE17962@radagast>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/24/2013 05:32 AM, Felipe Balbi wrote:
> Hi,
> 
> On Mon, Jul 01, 2013 at 04:03:41PM -0600, Stephen Warren wrote:
>> On 06/28/2013 03:36 PM, Tuomas Tynkkynen wrote:
>>> Hi,
>>> 
>>> Here's a few cleanup patches for the Tegra USB drivers, to be
>>> applied on top of Mikko's two patch sets. It mostly deals with
>>> removing all usage of platform data and using standard helpers
>>> and enums instead of Tegra-specific ones.
>> 
>> With the issues in patches 5/9 and 9/9 fixed as I mentioned, this
>> series,
>> 
>> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> so, do you want me to apply these myself ?

Yes, I believe if all of Tuomas's and Mikko's recent USB patches can
go through one of the USB trees, that would be best. Thanks!
