From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [v2] media: soc-camera: OF cameras
Date: Mon, 14 Apr 2014 18:38:32 +0100
Message-ID: <534C1D18.1030006@codethink.co.uk>
References: <1392235552-28134-1-git-send-email-pengw@nvidia.com> <1394794130-13660-1-git-send-email-josh.wu@atmel.com> <CAK5ve-KuPJa6rBdYGvkuPyQU5TCiEe1t=PzEKN4NgsKgVWogqA@mail.gmail.com> <Pine.LNX.4.64.1404102308500.25569@axis700.grange> <CAK5ve-KNivKYvyDAfp1nw6VgHG3AFuZzwC6gWV36pa3dpgkz1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5ve-KNivKYvyDAfp1nw6VgHG3AFuZzwC6gWV36pa3dpgkz1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14/04/14 18:14, Bryan Wu wrote:
> On Thu, Apr 10, 2014 at 2:18 PM, Guennadi Liakhovetski
> <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org> wrote:
>> Hi Bryan,
>>
>> On Tue, 8 Apr 2014, Bryan Wu wrote:
>>
>>> Thanks Josh, I think I will take you point and rework my patch again.
>>> But I need Guennadi's review firstly, Guennadi, could you please help
>>> to review it?
>>
>> Ok, let me double check the situation:
>>
>> 1. We've got this patch from you, aiming at adding OF probing support to
>> soc-camra
>>
>> 2. We've got an alternative patch from Ben to do the same, his last reply
>> to a comment to his patch was "Thanks, I will look into this."
>>
>> 3. We've got Ben's patches for rcar-vin, that presumably work with his
>> patch from (2) above
>>
>> 4. We've got Josh's patches to add OF / async probing to atmel-isi and
>> ov2640, that are not known to work with either (1) or (2) above, so, they
>> don't work at all, right?
>>
>> So, to summarise, there is a core patch from Ben, that he possibly wants
>> to adjust, and that works with his rcar-vin OF, there is a patch from you
>> that isn't known to work with any driver, and there are patches from Josh,
>> that don't work, because there isn't a suitable patch available for them.
>> I will have a look at your and Ben's soc-camera OF patches to compare them
>> and compare them with my early code (hopefully this coming weekend), but
>> so far it looks like only Ben's solution has a complete working stack. Am
>> I missing something?
>>
>
> My bad. I missed the conversation and patches from Ben Dooks and you guys.
> I have no problem for merging Ben's patch and I will align my Tegra
> Camera patch with that, probably posted later.

If possible, could you test the latest one? I've not had much time
to actually use this and would welcome some feedback.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
