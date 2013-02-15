From: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Fri, 15 Feb 2013 23:38:14 +0100
Message-ID: <511EB8D6.8090401@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
	<1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de>
	<50FECE63.7090009@tuebingen.mpg.de>
	<20130211091301.GC3423@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2026069448=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130211091301.GC3423@avionic-0098.mockup.avionic-design.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mario Kleiner <mario.kleiner@tuebingen.mpg.de>
List-Id: linux-tegra@vger.kernel.org

This is a multi-part message in MIME format.
--===============2026069448==
Content-Type: multipart/alternative;
 boundary="------------060101000103090403090701"

This is a multi-part message in MIME format.
--------------060101000103090403090701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2013 10:13 AM, Thierry Reding wrote:
> On Tue, Jan 22, 2013 at 06:37:39PM +0100, Mario Kleiner wrote:
>> On 14.01.13 17:05, Thierry Reding wrote:
>>> Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
>>> special in this case because it doesn't use the generic IRQ support
>>> provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
>>> interrupt handler for each display controller.
>>>
>>> While at it, clean up the way that interrupts are enabled to ensure
>>> that the VBLANK interrupt only gets enabled when required.
>>>
>>> Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
>> ... snip ...
>>
>>>   struct drm_driver tegra_drm_driver = {
>>>   	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
>>>   	.load = tegra_drm_load,
>>> @@ -96,6 +136,10 @@ struct drm_driver tegra_drm_driver = {
>>>   	.open = tegra_drm_open,
>>>   	.lastclose = tegra_drm_lastclose,
>>>
>>> +	.get_vblank_counter = drm_vblank_count,
>> -> .get_vblank_counter = drm_vblank_count is a no-op.
>>
>> .get_vblank_counter() is supposed to return some real hardware
>> vblank counter value to reinitialize the software vblank counter at
>> vbl irq enable time. That software counter gets queried via
>> drm_vblank_count(). If you hook this up to drm_vblank_count() it
>> essentially returns a constant, frozen vblank count, it has the same
>> effect as returning zero or any other constant value -- You lose all
>> vblank counter increments during vblank irq off time. The same
>> problem is present in nouveau-kms.
>>
>> I think it would be better to either implement a real hw counter
>> query, or some function with a /* TODO: Implement me properly */
>> comment which returns zero, so it is clear something is missing
>> here.
> I've finally managed to find some time to look into this some more. The
> comment atop the drm_driver.get_vblank_counter() field actually suggests
> that drivers should set this to drm_vblank_count if no real hardware
> counter is supported.

It certainly works fine that way. I just think it hides that some 
implementation is missing there, whereas an extra no-op function makes 
that clear to the reader.

> Now it seems like we may get functionality to obtain the real VBLANK
> counter once the syncpoint support is merged, so maybe we can leave this
> as-is until then and replace it with a proper implementation at that
> point in time?

Perfectly fine with me.

ciao,
-mario

> Alternatively I could use a small wrapper with an explicit comment that
> this should be implemented using the upcoming syncpoint support.
>
> Thierry
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel


--------------060101000103090403090701
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/11/2013 10:13 AM, Thierry Reding
      wrote:<br>
    </div>
    <blockquote
      cite="mid:20130211091301.GC3423@avionic-0098.mockup.avionic-design.de"
      type="cite">
      <pre wrap="">On Tue, Jan 22, 2013 at 06:37:39PM +0100, Mario Kleiner wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 14.01.13 17:05, Thierry Reding wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
special in this case because it doesn't use the generic IRQ support
provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
interrupt handler for each display controller.

While at it, clean up the way that interrupts are enabled to ensure
that the VBLANK interrupt only gets enabled when required.

Signed-off-by: Thierry Reding <a class="moz-txt-link-rfc2396E" href="mailto:thierry.reding@avionic-design.de">&lt;thierry.reding@avionic-design.de&gt;</a>
</pre>
        </blockquote>
        <pre wrap="">
... snip ...

</pre>
        <blockquote type="cite">
          <pre wrap=""> struct drm_driver tegra_drm_driver = {
 	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
 	.load = tegra_drm_load,
@@ -96,6 +136,10 @@ struct drm_driver tegra_drm_driver = {
 	.open = tegra_drm_open,
 	.lastclose = tegra_drm_lastclose,

+	.get_vblank_counter = drm_vblank_count,
</pre>
        </blockquote>
        <pre wrap="">
-&gt; .get_vblank_counter = drm_vblank_count is a no-op.

.get_vblank_counter() is supposed to return some real hardware
vblank counter value to reinitialize the software vblank counter at
vbl irq enable time. That software counter gets queried via
drm_vblank_count(). If you hook this up to drm_vblank_count() it
essentially returns a constant, frozen vblank count, it has the same
effect as returning zero or any other constant value -- You lose all
vblank counter increments during vblank irq off time. The same
problem is present in nouveau-kms.

I think it would be better to either implement a real hw counter
query, or some function with a /* TODO: Implement me properly */
comment which returns zero, so it is clear something is missing
here.
</pre>
      </blockquote>
      <pre wrap="">
I've finally managed to find some time to look into this some more. The
comment atop the drm_driver.get_vblank_counter() field actually suggests
that drivers should set this to drm_vblank_count if no real hardware
counter is supported.
</pre>
    </blockquote>
    <br>
    It certainly works fine that way. I just think it hides that some
    implementation is missing there, whereas an extra no-op function
    makes that clear to the reader.<br>
    <br>
    <blockquote
      cite="mid:20130211091301.GC3423@avionic-0098.mockup.avionic-design.de"
      type="cite">
      <pre wrap="">
Now it seems like we may get functionality to obtain the real VBLANK
counter once the syncpoint support is merged, so maybe we can leave this
as-is until then and replace it with a proper implementation at that
point in time?
</pre>
    </blockquote>
    <br>
    Perfectly fine with me.<br>
    <br>
    ciao,<br>
    -mario<br>
    <br>
    <blockquote
      cite="mid:20130211091301.GC3423@avionic-0098.mockup.avionic-design.de"
      type="cite">
      <pre wrap="">
Alternatively I could use a small wrapper with an explicit comment that
this should be implemented using the upcoming syncpoint support.

Thierry
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="http://lists.freedesktop.org/mailman/listinfo/dri-devel">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060101000103090403090701--

--===============2026069448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2026069448==--
