From: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/1] firmware: tegra: Add XHCI firmware v45.45 for
 T124
Date: Fri, 3 Oct 2014 18:14:12 -0700
Message-ID: <542F49E4.6040904@nvidia.com>
References: <1409256359-14072-1-git-send-email-achew@nvidia.com> <20140913022643.GI15412@merlin.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140913022643.GI15412-J9mDPBBB+i8CUdFEqe4BF2D2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle McMartin <kyle-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/12/2014 07:26 PM, Kyle McMartin wrote:
> On Thu, Aug 28, 2014 at 01:05:59PM -0700, Andrew Chew wrote:
>> Add firmware file for the T124 XHCI controller, along with the NVIDIA
>> license file.
>>
>> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Renamed the firmware binary as nvidia/tegra124/xusb.bin to be consistent
>> with the location decided upon during the xhci-tegra driver review.
>>
>>   LICENCE.nvidia           | 111 +++++++++++++++++++++++++++++++++++++++++++++++
>>   nvidia/tegra124/xusb.bin | Bin 0 -> 134656 bytes
>>   2 files changed, 111 insertions(+)
>>   create mode 100644 LICENCE.nvidia
>>   create mode 100644 nvidia/tegra124/xusb.bin
>>
>
> You'll need to update WHENCE as well... given there's an "open source
> exemption" in the license, would it be possible to ask your lawyers to
> relax this to something which is basically the BSD license + no
> modification like LICENCE.ibt_firmware and some others?

Kyle, sorry for the delay in response on this-- yes, we are evaluating 
the BSD-like license for firmware; however, we are distributing software 
under the license below, so we will start with the existing license and 
make a later switch if feasible.

Regardless, we need to spin a v3 of the patch so please hold-off to 
apply until then.

Thanks!
Eric

>
> regards, Kyle
>
>> diff --git a/LICENCE.nvidia b/LICENCE.nvidia
>> new file mode 100644
>> index 0000000..7448c39
>> --- /dev/null
>> +++ b/LICENCE.nvidia
>> @@ -0,0 +1,111 @@
>> +           License For Customer Use of NVIDIA Software
>> +
>> +
>> +IMPORTANT NOTICE -- READ CAREFULLY: This License For Customer Use of NVIDIA
>> +Software ("LICENSE") is the agreement which governs use of the software of
>> +NVIDIA Corporation and its subsidiaries ("NVIDIA") downloadable herefrom,
>> +including computer software and associated printed materials ("SOFTWARE").
>> +By downloading, installing, copying, or otherwise using the SOFTWARE, you agree
>> +to be bound by the terms of this LICENSE.  If you do not agree to the terms of
>> +this LICENSE, do not download the SOFTWARE.
>> +
>> +RECITALS
>> +
>> +Use of NVIDIA's products requires three elements: the SOFTWARE, the hardware,
>> +and a personal computer.  The SOFTWARE is protected by copyright laws and
>> +international copyright treaties, as well as other intellectual property laws
>> +and treaties.  The SOFTWARE is not sold, and instead is only licensed for use,
>> +strictly in accordance with this document.  The hardware is protected by
>> +various patents, and is sold, but this agreement does not cover that sale,
>> +since it may not necessarily be sold as a package with the SOFTWARE.  This
>> +agreement sets forth the terms and conditions of the SOFTWARE LICENSE only.
>> +
>> +1.  DEFINITIONS
>> +
>> +1.1  Customer.  Customer means the entity or individual that Downloads or
>> +otherwise obtains the SOFTWARE.
>> +
>> +2.  GRANT OF LICENSE
>> +
>> +2.1  Rights and Limitations of Grant.  NVIDIA hereby grants Customer the
>> +following non-exclusive, non-transferable right to use the SOFTWARE, with the
>> +following limitations:
>> +
>> +2.1.1  Rights.  Customer may install and use multiple copies of the SOFTWARE on
>> +a shared computer or concurrently on different computers, and make multiple
>> +back-up copies of the SOFTWARE, solely for Customer's use within Customer's
>> +Enterprise.  "Enterprise" shall mean individual use by Customer or any legal
>> +entity (such as a corporation or university) and the subsidiaries it owns by
>> +more than fifty percent (50%).
>> +
>> +2.1.2  Open Source Exception.  Notwithstanding the foregoing terms of
>> +Section 2.1.1, SOFTWARE may be copied and redistributed solely for use on
>> +operating systems distributed under the terms of an OSI-approved open source
>> +license as listed by the Open Source Initiative at http://opensource.org,
>> +provided that the binary files thereof are not modified.
>> +
>> +2.1.3  Limitations.
>> +
>> +No Reverse Engineering.  Customer may not reverse engineer, decompile, or
>> +disassemble the SOFTWARE, nor attempt in any other manner to obtain the source
>> +code.
>> +
>> +No Rental.  Customer may not rent or lease the SOFTWARE to someone else.
>> +
>> +3.  TERMINATION
>> +
>> +This LICENSE will automatically terminate if Customer fails to comply with any
>> +of the terms and conditions hereof.  In such event, Customer must destroy all
>> +copies of the SOFTWARE and all of its component parts.
>> +
>> +Defensive Suspension.  If Customer commences or participates in any legal
>> +proceeding against NVIDIA, then NVIDIA may, in its sole discretion, suspend or
>> +terminate all license grants and any other rights provided under this LICENSE
>> +during the pendency of such legal proceedings.
>> +
>> +4.  COPYRIGHT
>> +
>> +All title and copyrights in and to the SOFTWARE (including but not limited to
>> +all images, photographs, animations, video, audio, music, text, and other
>> +information incorporated into the SOFTWARE), the accompanying printed
>> +materials, and any copies of the SOFTWARE, are owned by NVIDIA, or its
>> +suppliers.  The SOFTWARE is protected by copyright laws and international
>> +treaty provisions.  Accordingly, Customer is required to treat the SOFTWARE
>> +like any other copyrighted material, except as otherwise allowed pursuant to
>> +this LICENSE and that it may make one copy of the SOFTWARE solely for backup or
>> +archive purposes.
>> +
>> +5.  APPLICABLE LAW
>> +
>> +This agreement shall be deemed to have been made in, and shall be construed
>> +pursuant to, the laws of the State of California.
>> +
>> +6.  DISCLAIMER OF WARRANTIES AND LIMITATION ON LIABILITY
>> +
>> +6.1  No Warranties.  TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THE
>> +SOFTWARE IS PROVIDED "AS IS" AND NVIDIA AND ITS SUPPLIERS DISCLAIM ALL
>> +WARRANTIES, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED
>> +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
>> +
>> +6.2  No Liability for Consequential Damages.  TO THE MAXIMUM EXTENT PERMITTED
>> +BY APPLICABLE LAW, IN NO EVENT SHALL NVIDIA OR ITS SUPPLIERS BE LIABLE FOR ANY
>> +SPECIAL, INCIDENTAL, INDIRECT, OR CONSEQUENTIAL DAMAGES WHATSOEVER (INCLUDING,
>> +WITHOUT LIMITATION, DAMAGES FOR LOSS OF BUSINESS PROFITS, BUSINESS
>> +INTERRUPTION, LOSS OF BUSINESS INFORMATION, OR ANY OTHER PECUNIARY LOSS)
>> +ARISING OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF NVIDIA HAS
>> +BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
>> +
>> +7.  MISCELLANEOUS
>> +
>> +The United Nations Convention on Contracts for the International Sale of Goods
>> +is specifically disclaimed.  If any provision of this LICENSE is inconsistent
>> +with, or cannot be fully enforced under, the law, such provision will be
>> +construed as limited to the extent necessary to be consistent with and fully
>> +enforceable under the law.  This agreement is the final, complete and exclusive
>> +agreement between the parties relating to the subject matter hereof, and
>> +supersedes all prior or contemporaneous understandings and agreements relating
>> +to such subject matter, whether oral or written.  Customer agrees that it will
>> +not ship, transfer or export the SOFTWARE into any country, or use the SOFTWARE
>> +in any manner, prohibited by the United States Bureau of Export Administration
>> +or any export laws, restrictions or regulations.  This LICENSE may only be
>> +modified in writing signed by an authorized officer of NVIDIA.
