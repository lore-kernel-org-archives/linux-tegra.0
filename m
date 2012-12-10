From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: ANNOUNCE: Tegra application notes, (and tegrarcm & cbootimage)
Date: Mon, 10 Dec 2012 10:37:41 -0700
Message-ID: <50C61DE5.4060509@wwwdotorg.org>
References: <50C2932A.7040501@wwwdotorg.org> <50C597CD.6060302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C597CD.6060302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/10/2012 01:05 AM, Mark Zhang wrote:
> On 12/08/2012 09:08 AM, Stephen Warren wrote:
>> I'd like to announce or remind people of some documentation and tools we
>> have for Tegra development.
...
>> Finally, we hope to publish cbootimage configuration files for NVIDIA's
>> Tegra reference boards in the very near future. That will complete the
>> picture above.
>>
> 
> Yep. It's better to provide an example of "text representation BCT" as
> well so that we can use "bct_dump" to generate a binary BCT file.

If you already have a binary BCT, bct_dump (also in the cbootimage git)
can generate the text representation for you. If you don't already have
a binary BCT, we'll be publishing the real text-based configuration
files hopefully soon. So I don't think there's a need for a separate
example is there?
