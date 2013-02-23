From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v3 0/6] ARM: tegra: convert device tree files to use CLK defines
Date: Sat, 23 Feb 2013 16:52:56 -0700
Message-ID: <51295658.7030105@wwwdotorg.org>
References: <1360917814-27236-1-git-send-email-hdoyu@nvidia.com> <1361138717.29465.2@driftwood> <5123B1F8.4040102@wwwdotorg.org> <1361649074.11282.12@driftwood>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361649074.11282.12@driftwood>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/23/2013 12:51 PM, Rob Landley wrote:
> On 02/19/2013 11:10:16 AM, Stephen Warren wrote:
>> On 02/17/2013 03:05 PM, Rob Landley wrote:
>> > On 02/15/2013 02:43:11 AM, Hiroshi Doyu wrote:
>> >> Hi,
>> >>
>> >> With new dtc+cpp feature, we could get rid of magic numbers in dts*
>> >> files. This patch replaces CLK IDs.
>> >>
>> >> We also plan to share those DT header files with kernel source
>> >> later[1].
>> > ...
>> >> [1]
>> >>
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/149804.html
>>
>> >>
>> >
>> > This really smells like documentation should be updated, probably
>> > booting-without-of.txt or similar. Alas, I'm not capable of writing
>> such
>> > an update...
>>
>> I'm not sure what documentation would be updated nor why. Can you
>> describe that?
> 
> "When writing new device tree files, please do not include magic
> numbers. Here's how to avoid them."
> 
> Does something in Documentation already say this somewhere?

This seems rather basic and not worth documenting. The technique is
identical to the use of header files in C/assembly/... code. I suppose
if we document that, then there would be an argument for documenting this.
