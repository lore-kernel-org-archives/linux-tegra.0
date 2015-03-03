From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/9] memory: tegra: add mc flush support
Date: Tue, 3 Mar 2015 17:03:37 +0900
Message-ID: <CAAVeFuJqa-4DqM8W2yXLUS9brfE8VgxT03FEQLSoKh26EddE8w@mail.gmail.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
 <1421216372-8025-3-git-send-email-vinceh@nvidia.com> <CAAVeFuLx5fr_kQonRZzTgsw-wND==jNwvMs9LkzhWrE0rRQ76w@mail.gmail.com>
 <54F42549.5040202@nvidia.com> <CAAVeFu+1dS-RXOEg0jmUcP907uErpOv687k=4FBJiGfKytMWPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFu+1dS-RXOEg0jmUcP907uErpOv687k=4FBJiGfKytMWPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 2, 2015 at 6:29 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> These functions are identical, excepted for the callback they are
>>> invoking. Could you merge the common part into a function that returns
>>> the right client to call the callback on, or ERR_PTR(-EINVAL) in case
>>> of failure?
>>
>> I couldn't think of a clever way to do this. Any ideas? :)
>
> How about something like this (warning: might now be that great, untested):
>
> /* Have this in your .h and use it in your tegra_mc_ops struct */
> typedef int (*mc_op)(struct tegra_mc *mc,
>              const struct tegra_mc_hotreset *hotreset)

This type should be named tegra_mc_op, since the header that defines
it is in include/linux.
