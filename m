From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/9] memory: tegra: add mc flush support
Date: Tue, 3 Mar 2015 17:31:42 +0900
Message-ID: <CAAVeFuK1ZSdBLc5p0xQkcOeGBB2MNtT+k0wg45MdO5bO=YgnnQ@mail.gmail.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
 <1421216372-8025-3-git-send-email-vinceh@nvidia.com> <CAAVeFuLx5fr_kQonRZzTgsw-wND==jNwvMs9LkzhWrE0rRQ76w@mail.gmail.com>
 <54F42549.5040202@nvidia.com> <CAAVeFu+1dS-RXOEg0jmUcP907uErpOv687k=4FBJiGfKytMWPA@mail.gmail.com>
 <CAAVeFuJqa-4DqM8W2yXLUS9brfE8VgxT03FEQLSoKh26EddE8w@mail.gmail.com>
 <54F56C26.1020202@nvidia.com> <CAAVeFuLfJJz92PdkjO1je-Hwz5smbzFKZ9=EipQ0qJTod1Xp2A@mail.gmail.com>
 <54F56E4E.9070004@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F56E4E.9070004-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 3, 2015 at 5:18 PM, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On 03/03/2015 04:14 PM, Alexandre Courbot wrote:
>>
>> On Tue, Mar 3, 2015 at 5:09 PM, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>> On 03/03/2015 04:03 PM, Alexandre Courbot wrote:
>>>>
>>>> On Mon, Mar 2, 2015 at 6:29 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> wrote:
>>>>>>>
>>>>>>> These functions are identical, excepted for the callback they are
>>>>>>> invoking. Could you merge the common part into a function that
>>>>>>> returns
>>>>>>> the right client to call the callback on, or ERR_PTR(-EINVAL) in case
>>>>>>> of failure?
>>>>>>
>>>>>> I couldn't think of a clever way to do this. Any ideas? :)
>>>>>
>>>>> How about something like this (warning: might now be that great,
>>>>> untested):
>>>>>
>>>>> /* Have this in your .h and use it in your tegra_mc_ops struct */
>>>>> typedef int (*mc_op)(struct tegra_mc *mc,
>>>>>                const struct tegra_mc_hotreset *hotreset)
>>>>
>>>> This type should be named tegra_mc_op, since the header that defines
>>>> it is in include/linux.
>>>
>>> Can we just leave it in this C file? I see no reason to place it in some
>>> other
>>> header file. :)
>>
>> Can you also move tegra_mc_ops's definition into the C file? If so I
>> agree. Otherwise I prefer to make sure that the same type is used
>> everywhere.
>
> No. Let's keep that in the include/soc/tegra/mc.h.

Actually, couldn't some of these definitions be moved into
drivers/memory/tegra/mc.h? I don't see any reference to e.g. struct
tegra_mc_soc outside of drivers/memory/tegra/. These doesn't seem to
be a need to make these available to everybody.
