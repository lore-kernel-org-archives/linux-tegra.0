From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] regulator: tps65090: remove usage of IS_ERR_OR_NULL
Date: Tue, 01 Oct 2013 09:49:34 -0600
Message-ID: <524AEF0E.6090207@wwwdotorg.org>
References: <1380600664-20649-1-git-send-email-badarkhe.manish@gmail.com> <20131001092258.GJ19304@sirena.org.uk> <CAKDJKT6kBi_axtn+qDBkwueRGn_zzOAdSstRF=x1OqX-TrO2XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKDJKT6kBi_axtn+qDBkwueRGn_zzOAdSstRF=x1OqX-TrO2XQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/01/2013 08:59 AM, Manish Badarkhe wrote:
> Hi Mark,
> 
> Thank you for your reply.
> 
> On Tue, Oct 1, 2013 at 2:52 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Tue, Oct 01, 2013 at 09:41:04AM +0530, Manish Badarkhe wrote:
>>> This patch changes the driver to avoid the usage of IS_ERR_OR_NULL()
>>> macro.
>>
>> Why?
> 
> Code use "IS_ERR_OR_NULL()" properly as per current implementation. But
> as per patches [1], [2] below, the use of "IS_ERR_OR_NULL()" has been
> deprecated.
> Hence done this change.

The intent was to deprecate to *concept* of checking a return value for
both NULL and an error. Simply removing usage of the macro and replacing
it with the exact same code that was part of the macro doesn't fulfil
the intent at all.
