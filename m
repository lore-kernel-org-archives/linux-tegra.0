From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Add kerneldoc for UAPI
Date: Sat, 19 May 2018 00:35:52 +0200
Message-ID: <20180518223552.GA30671@ulmo>
References: <20180517154132.10058-8-thierry.reding@gmail.com>
 <20180518203337.26476-1-thierry.reding@gmail.com>
 <71541779-b4a9-43f3-f3e0-dd74e244ba93@gmail.com>
 <20180518215819.GA28123@ulmo> <20180518221305.GA29384@ulmo>
 <015e6ef1-e020-f339-2517-49330cc8616a@gmail.com>
 <20180518222438.GB29384@ulmo>
 <9e4a9f6a-19eb-1b1e-3ac1-7b271330c722@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0731898504=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <9e4a9f6a-19eb-1b1e-3ac1-7b271330c722@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0731898504==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 19, 2018 at 01:28:17AM +0300, Dmitry Osipenko wrote:
> On 19.05.2018 01:24, Thierry Reding wrote:
> > On Sat, May 19, 2018 at 01:18:05AM +0300, Dmitry Osipenko wrote:
> >> On 19.05.2018 01:13, Thierry Reding wrote:
> >>> On Fri, May 18, 2018 at 11:58:19PM +0200, Thierry Reding wrote:
> >>>> On Sat, May 19, 2018 at 12:42:22AM +0300, Dmitry Osipenko wrote:
> >>>>> On 18.05.2018 23:33, Thierry Reding wrote:
> >>>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>>
> >>>>>> Document the userspace ABI with kerneldoc to provide some informat=
ion on
> >>>>>> how to use it.
> >>>>>>
> >>>>>> v2:
> >>>>>> - keep GEM object creation flags for ABI compatibility
> >>>>>> - fix typo in struct drm_tegra_syncpt_incr kerneldoc
> >>>>>> - fix typos in struct drm_tegra_submit kerneldoc
> >>>>>> - reworded some descriptions as suggested
> >>>>>>
> >>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>>> ---
> >>>>>>  include/uapi/drm/tegra_drm.h | 480 ++++++++++++++++++++++++++++++=
++++-
> >>>>>>  1 file changed, 471 insertions(+), 9 deletions(-)
> >>>>>>
> >>>>>> diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra=
_drm.h
> >>>>>> index 99e15d82d1e9..7e121c69cd9a 100644
> >>>>>> --- a/include/uapi/drm/tegra_drm.h
> >>>>>> +++ b/include/uapi/drm/tegra_drm.h
> >>>>>> @@ -32,143 +32,605 @@ extern "C" {
> >>>>>>  #define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
> >>>>>>  #define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_gem_create - parameters for the GEM object cr=
eation IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_gem_create {
> >>>>>> +	/**
> >>>>>> +	 * @size:
> >>>>>> +	 *
> >>>>>> +	 * The size, in bytes, of the buffer object to be created.
> >>>>>> +	 */
> >>>>>>  	__u64 size;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @flags:
> >>>>>> +	 *
> >>>>>> +	 * A bitmask of flags that influence the creation of GEM objects:
> >>>>>> +	 *
> >>>>>> +	 * DRM_TEGRA_GEM_CREATE_TILED
> >>>>>> +	 *   Use the 16x16 tiling format for this buffer.
> >>>>>> +	 *
> >>>>>> +	 * DRM_TEGRA_GEM_CREATE_BOTTOM_UP
> >>>>>> +	 *   The buffer has a bottom-up layout.
> >>>>>> +	 */
> >>>>>>  	__u32 flags;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @handle:
> >>>>>> +	 *
> >>>>>> +	 * The handle of the created GEM object. Set by the kernel upon
> >>>>>> +	 * successful completion of the IOCTL.
> >>>>>> +	 */
> >>>>>>  	__u32 handle;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_gem_mmap - parameters for the GEM mmap IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_gem_mmap {
> >>>>>> +	/**
> >>>>>> +	 * @handle:
> >>>>>> +	 *
> >>>>>> +	 * Handle of the GEM object to obtain an mmap offset for.
> >>>>>> +	 */
> >>>>>>  	__u32 handle;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @pad:
> >>>>>> +	 *
> >>>>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>>>> +	 */
> >>>>>>  	__u32 pad;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @offset:
> >>>>>> +	 *
> >>>>>> +	 * The mmap offset for the given GEM object. Set by the kernel u=
pon
> >>>>>> +	 * successful completion of the IOCTL.
> >>>>>> +	 */
> >>>>>>  	__u64 offset;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_syncpt_read - parameters for the read syncpoi=
nt IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_syncpt_read {
> >>>>>> +	/**
> >>>>>> +	 * @id:
> >>>>>> +	 *
> >>>>>> +	 * ID of the syncpoint to read the current value from.
> >>>>>> +	 */
> >>>>>>  	__u32 id;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @value:
> >>>>>> +	 *
> >>>>>> +	 * The current syncpoint value. Set by the kernel upon successful
> >>>>>> +	 * completion of the IOCTL.
> >>>>>> +	 */
> >>>>>>  	__u32 value;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_syncpt_incr - parameters for the increment sy=
ncpoint IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_syncpt_incr {
> >>>>>> +	/**
> >>>>>> +	 * @id:
> >>>>>> +	 *
> >>>>>> +	 * ID of the syncpoint to increment.
> >>>>>> +	 */
> >>>>>>  	__u32 id;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @pad:
> >>>>>> +	 *
> >>>>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>>>> +	 */
> >>>>>>  	__u32 pad;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_syncpt_wait - parameters for the wait syncpoi=
nt IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_syncpt_wait {
> >>>>>> +	/**
> >>>>>> +	 * @id:
> >>>>>> +	 *
> >>>>>> +	 * ID of the syncpoint to wait on.
> >>>>>> +	 */
> >>>>>>  	__u32 id;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @thresh:
> >>>>>> +	 *
> >>>>>> +	 * Threshold value for which to wait.
> >>>>>> +	 */
> >>>>>>  	__u32 thresh;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @timeout:
> >>>>>> +	 *
> >>>>>> +	 * Timeout, in milliseconds, to wait.
> >>>>>> +	 */
> >>>>>>  	__u32 timeout;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @value:
> >>>>>> +	 *
> >>>>>> +	 * The new syncpoint value after the wait. Set by the kernel upon
> >>>>>> +	 * successful completion of the IOCTL.
> >>>>>> +	 */
> >>>>>>  	__u32 value;
> >>>>>>  };
> >>>>>> =20
> >>>>>>  #define DRM_TEGRA_NO_TIMEOUT	(0xffffffff)
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_open_channel - parameters for the open channe=
l IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_open_channel {
> >>>>>> +	/**
> >>>>>> +	 * @client:
> >>>>>> +	 *
> >>>>>> +	 * The client ID for this channel.
> >>>>>> +	 */
> >>>>>>  	__u32 client;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @pad:
> >>>>>> +	 *
> >>>>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>>>> +	 */
> >>>>>>  	__u32 pad;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @context:
> >>>>>> +	 *
> >>>>>> +	 * The application context of this channel. Set by the kernel up=
on
> >>>>>> +	 * successful completion of the IOCTL. This context needs to be =
passed
> >>>>>> +	 * to the DRM_TEGRA_CHANNEL_CLOSE or the DRM_TEGRA_SUBMIT IOCTLs.
> >>>>>> +	 */
> >>>>>>  	__u64 context;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_close_channel - parameters for the close chan=
nel IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_close_channel {
> >>>>>> +	/**
> >>>>>> +	 * @context:
> >>>>>> +	 *
> >>>>>> +	 * The application context of this channel. This is obtained fro=
m the
> >>>>>> +	 * DRM_TEGRA_OPEN_CHANNEL IOCTL.
> >>>>>> +	 */
> >>>>>>  	__u64 context;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_get_syncpt - parameters for the get syncpoint=
 IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_get_syncpt {
> >>>>>> +	/**
> >>>>>> +	 * @context:
> >>>>>> +	 *
> >>>>>> +	 * The application context identifying the channel for which to =
obtain
> >>>>>> +	 * the syncpoint ID.
> >>>>>> +	 */
> >>>>>>  	__u64 context;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @index:
> >>>>>> +	 *
> >>>>>> +	 * Index of the client syncpoint for which to obtain the ID.
> >>>>>> +	 */
> >>>>>>  	__u32 index;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @id:
> >>>>>> +	 *
> >>>>>> +	 * The ID of the given syncpoint. Set by the kernel upon success=
ful
> >>>>>> +	 * completion of the IOCTL.
> >>>>>> +	 */
> >>>>>>  	__u32 id;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_get_syncpt_base - parameters for the get wait=
 base IOCTL
> >>>>>> + */
> >>>>>>  struct drm_tegra_get_syncpt_base {
> >>>>>> +	/**
> >>>>>> +	 * @context:
> >>>>>> +	 *
> >>>>>> +	 * The application context identifying for which channel to obta=
in the
> >>>>>> +	 * wait base.
> >>>>>> +	 */
> >>>>>>  	__u64 context;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @syncpt:
> >>>>>> +	 *
> >>>>>> +	 * ID of the syncpoint for which to obtain the wait base.
> >>>>>> +	 */
> >>>>>>  	__u32 syncpt;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @id:
> >>>>>> +	 *
> >>>>>> +	 * The ID of the wait base corresponding to the client syncpoint=
=2E Set
> >>>>>> +	 * by the kernel upon successful completion of the IOCTL.
> >>>>>> +	 */
> >>>>>>  	__u32 id;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_syncpt - syncpoint increment operation
> >>>>>> + */
> >>>>>>  struct drm_tegra_syncpt {
> >>>>>> +	/**
> >>>>>> +	 * @id:
> >>>>>> +	 *
> >>>>>> +	 * ID of the syncpoint to operate on.
> >>>>>> +	 */
> >>>>>>  	__u32 id;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @incrs:
> >>>>>> +	 *
> >>>>>> +	 * Number of increments to perform for the syncpoint.
> >>>>>> +	 */
> >>>>>>  	__u32 incrs;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_cmdbuf - structure describing a command buffer
> >>>>>> + */
> >>>>>>  struct drm_tegra_cmdbuf {
> >>>>>> +	/**
> >>>>>> +	 * @handle:
> >>>>>> +	 *
> >>>>>> +	 * Handle to a GEM object containing the command buffer.
> >>>>>> +	 */
> >>>>>>  	__u32 handle;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @offset:
> >>>>>> +	 *
> >>>>>> +	 * Offset, in bytes, into the GEM object identified by @handle at
> >>>>>> +	 * which the command buffer starts.
> >>>>>> +	 */
> >>>>>>  	__u32 offset;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @words:
> >>>>>> +	 *
> >>>>>> +	 * Number of 32-bit words in this command buffer.
> >>>>>> +	 */
> >>>>>>  	__u32 words;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @pad:
> >>>>>> +	 *
> >>>>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>>>> +	 */
> >>>>>>  	__u32 pad;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_reloc - GEM object relocation structure
> >>>>>> + */
> >>>>>>  struct drm_tegra_reloc {
> >>>>>>  	struct {
> >>>>>> +		/**
> >>>>>> +		 * @cmdbuf.handle:
> >>>>>> +		 *
> >>>>>> +		 * Handle to the GEM object containing the command buffer for
> >>>>>> +		 * which to perform this GEM object relocation.
> >>>>>> +		 */
> >>>>>>  		__u32 handle;
> >>>>>> +
> >>>>>> +		/**
> >>>>>> +		 * @cmdbuf.offset:
> >>>>>> +		 *
> >>>>>> +		 * Offset, in bytes, into the command buffer at which to
> >>>>>> +		 * insert the relocated address.
> >>>>>> +		 */
> >>>>>>  		__u32 offset;
> >>>>>>  	} cmdbuf;
> >>>>>>  	struct {
> >>>>>> +		/**
> >>>>>> +		 * @target.handle:
> >>>>>> +		 *
> >>>>>> +		 * Handle to the GEM object to be relocated.
> >>>>>> +		 */
> >>>>>>  		__u32 handle;
> >>>>>> +
> >>>>>> +		/**
> >>>>>> +		 * @target.offset:
> >>>>>> +		 *
> >>>>>> +		 * Offset, in bytes, into the target GEM object at which the
> >>>>>> +		 * relocated data starts.
> >>>>>> +		 */
> >>>>>>  		__u32 offset;
> >>>>>>  	} target;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @shift:
> >>>>>> +	 *
> >>>>>> +	 * The number of bits by which to shift relocated addresses.
> >>>>>> +	 */
> >>>>>>  	__u32 shift;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @pad:
> >>>>>> +	 *
> >>>>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>>>> +	 */
> >>>>>>  	__u32 pad;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_waitchk - wait check structure
> >>>>>> + */
> >>>>>>  struct drm_tegra_waitchk {
> >>>>>> +	/**
> >>>>>> +	 * @handle:
> >>>>>> +	 *
> >>>>>> +	 * Handle to the GEM object containing a command stream on which=
 to
> >>>>>> +	 * perform the wait check.
> >>>>>> +	 */
> >>>>>>  	__u32 handle;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @offset:
> >>>>>> +	 *
> >>>>>> +	 * Offset, in bytes, of the location in the command stream to pe=
rform
> >>>>>> +	 * the wait check on.
> >>>>>> +	 */
> >>>>>>  	__u32 offset;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @syncpt:
> >>>>>> +	 *
> >>>>>> +	 * ID of the syncpoint to wait check.
> >>>>>> +	 */
> >>>>>>  	__u32 syncpt;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @thresh:
> >>>>>> +	 *
> >>>>>> +	 * Threshold value for which to check.
> >>>>>> +	 */
> >>>>>>  	__u32 thresh;
> >>>>>>  };
> >>>>>> =20
> >>>>>> +/**
> >>>>>> + * struct drm_tegra_submit - job submission structure
> >>>>>> + */
> >>>>>>  struct drm_tegra_submit {
> >>>>>> +	/**
> >>>>>> +	 * @context:
> >>>>>> +	 *
> >>>>>> +	 * The application context identifying the channel to use for the
> >>>>>> +	 * execution of this job.
> >>>>>> +	 */
> >>>>>>  	__u64 context;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @num_syncpts:
> >>>>>> +	 *
> >>>>>> +	 * The number of syncpoints operated on by this job.
> >>>>>> +	 */
> >>>>>>  	__u32 num_syncpts;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @num_cmdbufs:
> >>>>>> +	 *
> >>>>>> +	 * The number of command buffers to execute as part of this job.
> >>>>>> +	 */
> >>>>>>  	__u32 num_cmdbufs;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @num_relocs:
> >>>>>> +	 *
> >>>>>> +	 * The number of relocations to perform before executing this jo=
b.
> >>>>>> +	 */
> >>>>>>  	__u32 num_relocs;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @num_waitchks:
> >>>>>> +	 *
> >>>>>> +	 * The number of wait checks to perform as part of this job.
> >>>>>> +	 */
> >>>>>>  	__u32 num_waitchks;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @waitchk_mask:
> >>>>>> +	 *
> >>>>>> +	 * Bitmask of valid wait checks.
> >>>>>> +	 */
> >>>>>>  	__u32 waitchk_mask;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @timeout:
> >>>>>> +	 *
> >>>>>> +	 * Timeout, in milliseconds, before this job is cancelled.
> >>>>>> +	 */
> >>>>>>  	__u32 timeout;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @syncpts:
> >>>>>> +	 *
> >>>>>> +	 * A pointer to @num_syncpts &struct drm_tegra_syncpt structures=
 that
> >>>>>
> >>>>> I'm not sure whether this "pointer to @num_syncpts" makes sense, sh=
ouldn't it be:
> >>>>>
> >>>>> 	A pointer to &struct drm_tegra_syncpt structures that...
> >>>>>
> >>>>> ?
> >>>>>
> >>>>> Same for the @cmdbufs/@relocs/@waitchks members.
> >>>>
> >>>> I wanted to have the references to those fields in the text so that =
it
> >>>> becomes obvious that num_syncpts defines the number of entries in th=
is
> >>>> syncpts array.
> >>>>
> >>>> Perhaps a better formulation would be:
> >>>>
> >>>> 	A pointer to an array of @num_syncpts &struct drm_tegra_syncpt
> >>>> 	structure that...
> >>>>
> >>>> ?
> >>
> >> That variant is good to me.
> >>
> >>>
> >>> Another alternative may be:
> >>>
> >>> 	/**
> >>> 	 * @syncpts:
> >>> 	 *
> >>> 	 * A pointer to an array of &struct drm_tegra_syncpt structure that
> >>> 	 * specify the syncpoint operations performed as part of this job.
> >>> 	 * The number of elements in the array must be equal to the value
> >>> 	 * given by @num_syncpts.
> >>> 	 */
> >>>
> >>> That's slightly easier to read but also very explicit in relating both
> >>> fields to one another. Perhaps a two-way link can be established by
> >>> adding something like this to the description of @num_syncpts:
> >>>
> >>> 	/**
> >>> 	 * @num_syncpts:
> >>> 	 *
> >>> 	 * The number of syncpoints operated on by this job. This defines
> >>> 	 * the length of the array pointed to by @syncpts.
> >>> 	 */
> >>
> >> But this variant is even better.
> >>
> >> I don't mind either way, choose what you prefer.
> >=20
> > I went with the latter. I've updated all of these field descriptions and
> > added your Reviewed-by. Pushed everything to drm/tegra/for-next and will
> > send a pull request for that branch shortly.
>=20
> Awesome! I think Mikko was going to make a patch to the validation bug in=
 the
> submit code that he spotted recently, so maybe it would worth to postpone=
 the
> pull request a tad.

This is for the main feature pull request for v4.18-rc1, for which the
deadline is usually -rc6 of the previous version, so this is already
cutting it rather close. If Mikko has a bugfix patch that's something
that can go into a separate -fixes pull request.

Thierry

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr/VUgACgkQ3SOs138+
s6FhwxAAlW1S/om8gKyZtbVv4/yOMDOYxc+VCJzP8E52OPTfCJGel+zu8/7UuPaG
OaRwV1hWrxPxGsJen0lFn+JuONLTwZtTbi1JP4BVlXmsGAfIFF2XWr2JrFyXeYMx
nVH2mBHWnDEJMrkW18eIlnd4GLJ/5TDDf0fEAvnc4JfP35hBafEgkR2aqBMWVO+H
xMqpcZrmlJoWX7jojOiTQUXdYABACLNvmnVKpohSAAPcpU9opMCSaDcZNem/Jq6d
R3/lCCfJdpB8hH+MbPlOz11ZUPHblHItZtFsOPnebfEVV/tY0YHeP1V9ryGCcmAx
2uASbAlfxcKKHxs9mhNnNP3U3X4TAgavJZ/5QrFPqg4Tx4OXJs5GHg7mADkrF0bd
A+IVeqWHcPkD4Ikzch+5c90fcQ7anPqZcQQx1beJOOP3TwtUARYOA8KTgw7rlKqK
s2mnts/E6Lshi3BKE7mw55rmUkgmMeMeHPsaxWkHifOz0tZyV0kxv+j3jIh11jgV
QL7+3DmVsfAIHz1Pj9nDFQBbLHvlri/RscGSJ8B94AacvR3BzeI1JmAA7AgyH9Ng
YZCRaPM7vRbIGZll36+SwDdARtDylUD6ZyJjgE8EvbqlhSgtShgqGsOVfKNGdjgf
wgnKnrnIo4DWGNGUK/ODDiNVr0kjk7F7Wlz04RiqUXqT72g6tZU=
=gGGQ
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

--===============0731898504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0731898504==--
