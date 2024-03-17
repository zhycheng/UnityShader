using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseCode02 : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
       
    }

    // Update is called once per frame
    void Update()
    {
      Matrix4x4 mvp= Camera.main.projectionMatrix*Camera.main.worldToCameraMatrix*this.transform.localToWorldMatrix;
        this.GetComponent<MeshRenderer>().material.SetMatrix("mvp", mvp);
    }
}
