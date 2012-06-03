From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator
 tps65911
Date: Sun, 03 Jun 2012 06:11:21 -1000
Message-ID: <4FCB8CA9.40602@firmworks.com>
References: <4FBBCA8F.3050903@wwwdotorg.org> <4FBBD33C.8020802@nvidia.com>
 <4FBBDA97.6000006@wwwdotorg.org> <4FBBDE06.5080806@nvidia.com>
 <4FC916AC.4060804@wwwdotorg.org>
 <20120601204052.GB4258@opensource.wolfsonmicro.com>
 <4FC92990.5030104@wwwdotorg.org>
 <20120601210451.GC4258@opensource.wolfsonmicro.com>
 <CAOesGMgYAR938F8PnVWaymzMBQwDKeAiUgEP81bv2nN14NmLGg@mail.gmail.com>
 <4FCACFB6.2060601@gmail.com>
 <20120603120506.GG4258@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4410612512823642337=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120603120506.GG4258-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is a multi-part message in MIME format.
--===============4410612512823642337==
Content-Type: multipart/alternative;
 boundary="------------090800080201060304060301"

This is a multi-part message in MIME format.
--------------090800080201060304060301
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/2012 2:05 AM, Mark Brown wrote:
> On Sat, Jun 02, 2012 at 09:45:10PM -0500, Rob Herring wrote:
>
>> I tend to agree with Steven's and Olof's comments in this thread. As the
>> node names generally don't have much meaning, I don't think we should
>> start now. We've already got multiple styles of bindings and I don't
>> think we need more.
>
> Well, if we're going to go with an existing idiom the normal thing would
> be an ordered array which is absolutely abysmal from a usability
> standpoint.  Compatible properties don't work as the whole reason we
> have an issue here is that people want to have a single node
> representing a group of regulators - for regulators which we can add a
> compatible property to we're already doing that and have no issue.
>
> What device tree seems to need rather badly is a way of representing
> key/value pairs -

Perhaps ironically, the fundamental device tree construct - the 
"property" - is a key/value pair.

> aside from the legacy bindings that seems to be the
> major source of pain when trying to contort things into DT.
>
> Using the "regulator" string that we have to put in the binding (which
> is currently totally meaningless) does seem like a good way forward
> here.
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

--------------090800080201060304060301
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>On 6/3/2012 2:05 AM, Mark Brown wrote:</tt>
    <blockquote
      cite="mid:20120603120506.GG4258-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org"
      type="cite">
      <pre wrap=""><tt>On Sat, Jun 02, 2012 at 09:45:10PM -0500, Rob Herring wrote:

</tt></pre>
      <blockquote type="cite">
        <pre wrap=""><tt>I tend to agree with Steven's and Olof's comments in this thread. As the
node names generally don't have much meaning, I don't think we should
start now. We've already got multiple styles of bindings and I don't
think we need more.
</tt></pre>
      </blockquote>
      <pre wrap=""><tt>
Well, if we're going to go with an existing idiom the normal thing would
be an ordered array which is absolutely abysmal from a usability
standpoint.  Compatible properties don't work as the whole reason we
have an issue here is that people want to have a single node
representing a group of regulators - for regulators which we can add a
compatible property to we're already doing that and have no issue.

What device tree seems to need rather badly is a way of representing
key/value pairs - </tt></pre>
    </blockquote>
    <br>
    Perhaps ironically, the fundamental device tree construct - the
    "property" - is a key/value pair.<br>
    <br>
    <blockquote
      cite="mid:20120603120506.GG4258-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org"
      type="cite">
      <pre wrap=""><tt>aside from the legacy bindings that seems to be the
major source of pain when trying to contort things into DT.

Using the "regulator" string that we have to put in the binding (which
is currently totally meaningless) does seem like a good way forward
here.
</tt></pre>
      <tt><br>
      </tt>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <tt><br>
      </tt>
      <pre wrap=""><tt>_______________________________________________
devicetree-discuss mailing list
<a class="moz-txt-link-abbreviated" href="mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/devicetree-discuss">https://lists.ozlabs.org/listinfo/devicetree-discuss</a>
</tt></pre>
    </blockquote>
  </body>
</html>

--------------090800080201060304060301--

--===============4410612512823642337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4410612512823642337==--
