From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fuse: add fuctions to read speedo id and
 process id
Date: Tue, 19 Mar 2013 19:50:19 -0600
Message-ID: <514915DB.8060206@wwwdotorg.org>
References: <1363660405-10668-1-git-send-email-dahuang@nvidia.com>  <5148A8D6.8000002@wwwdotorg.org> <1363743557.3573.50.camel@dahuang-vm>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363743557.3573.50.camel@dahuang-vm>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 07:39 PM, Danny Huang wrote:
> On Wed, 2013-03-20 at 02:05 +0800, Stephen Warren wrote:
>> On 03/18/2013 08:33 PM, Danny Huang wrote:
>>> Add functions to read the speedo and process id of both cpu and soc.
>>> There might be some drivers need the information as well.
>>
>> What code wants to use these functions? It'd be best to submit this
>> patch with that code, so that something actually uses the functions, and
>> they don't look like dead code.
> 
> There are some developing drivers that are located in drivers folder
> needs those information.

Which drivers?

> I think that they can't include a header file in mach-tegra folder

True.
